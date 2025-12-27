vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>q", ':q <CR>', { desc = "quit" }) 
keymap.set("n", "<leader>w", ':w <CR>', { desc = "write" }) 
keymap.set("n", "<leader>a", ':suspend <CR>', { desc = "suspend" }) 
keymap.set("n", "<leader>o", ':update <CR> :source <CR>', { desc = "source" }) 
-- oil keymaps 
	
keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "open oil" }) -- split window vertically
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
----- tab keymaps --------
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set('n', '<c-k>',':wincmd k<CR>')
keymap.set('n', '<c-j>',':wincmd j<CR>')
keymap.set('n', '<c-h>',':wincmd h<CR>')
keymap.set('n', '<c-l>',':wincmd l<CR>')

-- togle terminal 

keymap.set('n', '<leader>tt','<cmd>ToggleTerm direction=float <CR>',{desc="open floating term"})

---harpoon keymaps --- 

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>fh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n","<leader>ha",function () harpoon:list():add() end, {desc = "harpoon a file"})

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end,{desc="clear harpoon buffer"})
vim.keymap.set("n", "<leader>hd", function() harpoon:list():remove() end,{desc="remove harpoon file"})

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Find harpoon" })



-- tmux navigation ---


local nvim_tmux_nav = require("nvim-tmux-navigation")

vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)



