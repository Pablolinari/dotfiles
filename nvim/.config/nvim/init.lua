require("config.lazy")
require("config.options")
require("config.keymaps")
vim.cmd('colorscheme tokyonight')
vim.o.conceallevel = 2
vim.api.nvim_set_keymap('n', '<leader>pp', ':Ex ~/.config/nvim/lua/plugins', { noremap = true, silent = true })

