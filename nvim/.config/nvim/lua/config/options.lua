vim.cmd("let g:netrw_liststyle = 3")

-- Neovim solo reconoce ".typ" como Typst por defecto; los archivos
-- terminados en ".typst" (usados en este proyecto) no recibían filetype,
-- por lo que tinymist (LSP) nunca se adjuntaba y no había autocompletado.
vim.filetype.add({ extension = { typst = "typst" } })
local opt = vim.opt
opt.relativenumber = true
opt.number = true
opt.clipboard = "unnamedplus"
opt.mouse ="a"

--tabs and identations 
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true

--search setings 
opt.ignorecase=true
opt.smartcase=true
opt.cursorline=true
----colorscheme
opt.termguicolors=true
opt.background="dark"
opt.signcolumn="yes"
----- backspace 
 opt.backspace = "indent,eol,start"
 --splitwindows 
 opt.splitright=true
 opt.splitbelow=true
