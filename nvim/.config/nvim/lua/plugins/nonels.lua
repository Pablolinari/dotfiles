return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.clang_format,
	--		  null_ls.builtins.diagnostics.eslint,
	--			null_ls.builtins.diagnostics.cpplint,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				-- solo si isort está instalado (si no, none-ls da error al formatear)
				null_ls.builtins.formatting.isort.with({
					condition = function()
						return vim.fn.executable("isort") == 1
					end,
				}),
				null_ls.builtins.formatting.typstyle,
			},
		})

		-- Formatea con none-ls (black/isort para Python, clang-format para C/C++, ...)
		vim.keymap.set({ "n", "v" }, "<leader>gf", function()
			vim.lsp.buf.format({
				timeout_ms = 5000,
				filter = function(client)
					return client.name == "null-ls"
				end,
			})
		end, { desc = "Formatear archivo" })
	end,
}
