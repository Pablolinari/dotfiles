vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

opt.number = true
opt.clipboard = "unnamedplus"
opt.mouse ="a"

--tabs and identations 
opt.tabstop = 4 
opt.shiftwidth = 4 
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
