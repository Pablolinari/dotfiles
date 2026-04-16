return {
{
  'f4z3r/gruvbox-material.nvim',
  name = 'gruvbox-material',
  lazy = false,
  priority = 1000,
  init = function()
    vim.api.nvim_create_autocmd("ColorSchemePre", {
      pattern = "gruvbox-material",
      callback = function()
        vim.o.background = "light"
      end,
    })
  end,
  opts = {
    italics = false,
    contrast = "medium",
    comments = {
      italics = false,
    },
    background = {
      transparent = false,
    },
    float = {
      force_background = false,
      background_color = nil,
    },
    signs = {
      force_background = false,
      background_color = nil,
    },
    customize = nil,
  },
},
	{
		"vague2k/vague.nvim",
		priority = 1000,
		config = function()
			require("vague").setup({ transparent = true })
		end
	},
	{"rebelot/kanagawa.nvim"},
{ "rjmacarthy/oscura-vscode.nvim" },

	{
		"oskarnurm/koda.nvim",
		priority = 1000,
	},
	{
		"alexanderbluhm/black.nvim"

	},
	{
		"Mofiqul/adwaita.nvim",
        lazy = false,
        priority = 1000,
	},
	{
		"andreypopp/vim-colors-plain",
	},
	{
		'Mofiqul/vscode.nvim',
		priority = 1000,

	},
	{
		"Shatur/neovim-ayu",
		priority = 1000, -- Ensure it loads first
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- Ensure it loads first
	},


	{
		"folke/tokyonight.nvim",
		priority = 1000,
	},
	
}
