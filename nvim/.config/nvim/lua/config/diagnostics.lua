-- Diagnósticos: el mensaje aparece como texto virtual solo en la línea del cursor,
-- y con <leader>d se abre una ventana flotante con el mensaje completo.

vim.diagnostic.config({
	virtual_text = {
		current_line = true, -- solo en la línea donde está el cursor
		prefix = "●",
		spacing = 2,
	},
	signs = true,
	underline = true,
	severity_sort = true,
	update_in_insert = false,
	float = {
		border = "rounded",
		source = true, -- muestra qué LSP/linter da el error
	},
})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Ver diagnóstico completo" })
