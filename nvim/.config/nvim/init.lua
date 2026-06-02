require("config.lazy")
-- Función para compilar Typst y refrescar Zathura
local function compile_typst()
	local file = vim.fn.expand("%:p") -- Ruta completa del archivo actual
	local output = vim.fn.expand("%:p:r") .. ".pdf" -- Ruta del PDF resultante

	-- Ejecuta la compilación de forma asíncrona para no congelar Neovim
	vim.fn.jobstart({ "typst", "compile", file }, {
		on_exit = function(j, code)
			if code == 0 then
				-- Opcional: Avisar en la línea de comandos que compiló con éxito
				-- print("Typst compilado con éxito")
			else
				print("Error al compilar Typst")
			end
		end,
	})
end

-- Autocomando que se dispara al guardar (.typ)
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.typ",
	callback = function()
		compile_typst()
	end,
})
require("config.options")
require("config.keymaps")
vim.o.conceallevel = 2
vim.cmd(":hi statusline guibg=NONE")
-- para transparencia
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.cmd("colorscheme onedark")
vim.g.adwaita_darker = true -- for darker version
--cambiar colores  del fondo
vim.o.background = "light"

-- Habilita la auto-lectura de archivos modificados externamente
vim.o.autoread = true

-- Forzar a Neovim a revisar si hay cambios al cambiar de foco o dejar la terminal
vim.api.nvim_create_autocmd({ "FocusGained", "TermLeave", "TermClose", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})
-- La pestaña que SÍ está activa
-- Lua:
--vim.g.adwaita_disable_cursorline = true -- to disable cursorline
--vim.g.adwaita_transparent = true -- makes the background transparent
