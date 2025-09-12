require("config.lazy")
require("config.options")
require("config.keymaps")
vim.o.conceallevel = 2
vim.cmd(":hi statusline guibg=NONE") 
-- para transparencia 
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.cmd('colorscheme moonfly')
