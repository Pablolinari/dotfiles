require("config.lazy")
require("config.options")
require("config.keymaps")
vim.o.conceallevel = 2
vim.cmd(":hi statusline guibg=NONE") 
-- para transparencia 
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.cmd('colorscheme gruvbox')
vim.g.adwaita_darker = true -- for darker version
--cambiar colores  del fondo 
vim.o.background = 'light'


-- La pestaña que SÍ está activa
-- Lua:
--vim.g.adwaita_disable_cursorline = true -- to disable cursorline
--vim.g.adwaita_transparent = true -- makes the background transparent
