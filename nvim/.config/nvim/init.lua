require("config.lazy")
require("config.options")
require("config.keymaps")
vim.o.conceallevel = 2
vim.cmd(":hi statusline guibg=NONE") 
-- para transparencia 
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.g.adwaita_darker = true -- for darker version
vim.cmd('colorscheme koda-moss')
vim.lsp.inlay_hint.enable(true)
-- Lua:
--vim.g.adwaita_disable_cursorline = true -- to disable cursorline
--vim.g.adwaita_transparent = true -- makes the background transparent
