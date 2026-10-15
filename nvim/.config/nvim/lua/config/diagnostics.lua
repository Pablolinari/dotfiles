-- Diagnósticos estilo Helix: los errores/warnings de la línea del cursor
-- se muestran en una ventana flotante arriba a la derecha de la ventana actual.

vim.diagnostic.config({
	virtual_text = false, -- sin texto al final de la línea (como Helix)
	signs = true,
	underline = true,
	severity_sort = true,
	update_in_insert = false,
})

local severity_hl = {
	[vim.diagnostic.severity.ERROR] = "DiagnosticError",
	[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
	[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
	[vim.diagnostic.severity.HINT] = "DiagnosticHint",
}

local ns = vim.api.nvim_create_namespace("helix_diagnostics")
local state = { win = nil, buf = nil }

local function close()
	if state.win and vim.api.nvim_win_is_valid(state.win) then
		vim.api.nvim_win_close(state.win, true)
	end
	state.win = nil
end

-- Parte un texto en líneas de como mucho `width` columnas, cortando por palabras
local function wrap(text, width)
	local lines = {}
	for paragraph in (text .. "\n"):gmatch("(.-)\n") do
		local line = ""
		for word in paragraph:gmatch("%S+") do
			if line == "" then
				line = word
			elseif vim.fn.strdisplaywidth(line .. " " .. word) <= width then
				line = line .. " " .. word
			else
				table.insert(lines, line)
				line = word
			end
		end
		table.insert(lines, line)
	end
	return lines
end

local function update()
	local win = vim.api.nvim_get_current_win()
	-- No hacer nada dentro de ventanas flotantes
	if vim.api.nvim_win_get_config(win).relative ~= "" then
		return
	end

	local bufnr = vim.api.nvim_get_current_buf()
	local lnum = vim.api.nvim_win_get_cursor(win)[1] - 1
	local diags = vim.diagnostic.get(bufnr, { lnum = lnum })
	if #diags == 0 then
		close()
		return
	end
	table.sort(diags, function(a, b)
		return a.severity < b.severity
	end)

	local win_width = vim.api.nvim_win_get_width(win)
	local max_width = math.max(20, math.floor(win_width * 0.5))

	local lines, hls, width = {}, {}, 1
	for _, d in ipairs(diags) do
		for _, l in ipairs(wrap(d.message, max_width)) do
			table.insert(lines, l)
			table.insert(hls, severity_hl[d.severity] or "DiagnosticInfo")
			width = math.max(width, vim.fn.strdisplaywidth(l))
		end
	end

	if not (state.buf and vim.api.nvim_buf_is_valid(state.buf)) then
		state.buf = vim.api.nvim_create_buf(false, true)
		vim.bo[state.buf].bufhidden = "hide"
	end
	vim.api.nvim_buf_set_lines(state.buf, 0, -1, false, lines)
	vim.api.nvim_buf_clear_namespace(state.buf, ns, 0, -1)
	for i, hl in ipairs(hls) do
		vim.api.nvim_buf_set_extmark(state.buf, ns, i - 1, 0, { line_hl_group = hl })
	end

	local height = math.min(#lines, math.max(1, vim.api.nvim_win_get_height(win) - 1))
	local cfg = {
		relative = "win",
		win = win,
		anchor = "NE",
		row = 0,
		col = win_width,
		width = width,
		height = height,
		focusable = false,
		zindex = 45,
	}

	if state.win and vim.api.nvim_win_is_valid(state.win) then
		vim.api.nvim_win_set_config(state.win, cfg)
	else
		cfg.style = "minimal"
		cfg.border = "none"
		cfg.noautocmd = true
		state.win = vim.api.nvim_open_win(state.buf, false, cfg)
		vim.wo[state.win].wrap = false
		vim.wo[state.win].winhighlight = "Normal:NormalFloat"
	end
end

local group = vim.api.nvim_create_augroup("HelixDiagnostics", { clear = true })
vim.api.nvim_create_autocmd(
	{ "CursorMoved", "CursorMovedI", "BufEnter", "WinEnter", "WinResized", "DiagnosticChanged" },
	{
		group = group,
		callback = function()
			-- schedule: evita errores al abrir/cerrar ventanas dentro de autocmds
			vim.schedule(update)
		end,
	}
)
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, { group = group, callback = close })
