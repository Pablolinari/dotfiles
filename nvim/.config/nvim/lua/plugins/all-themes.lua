return {
{
  "loctvl842/monokai-pro.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("monokai-pro").setup()
  end,
},
{ 'datsfilipe/min-theme.nvim' },
	{
		"bjarneo/white.nvim",
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"sainnhe/everforest",
		priority = 1000,
	},
	{
		"kepano/flexoki-neovim",
		priority = 1000,
	},
	{
		"tahayvr/matteblack.nvim",
		priority = 1000,
	},
	{
		"shaunsingh/nord.nvim",
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
	},
	{
		"OldJobobo/miasma.nvim",
		priority = 1000,
	},
	{
		"OldJobobo/retro-82.nvim",
		priority = 1000,
	},
	{
		"omacom-io/lumon.nvim",
		priority = 1000,
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		priority = 1000,
		opts = {
			contrast = "soft",
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
		},
	},
	{
		"vague2k/vague.nvim",
		priority = 1000,
		config = function()
			require("vague").setup({ transparent = true })
		end,
	},
	{ "rjmacarthy/oscura-vscode.nvim" },
	{
		"oskarnurm/koda.nvim",
		priority = 1000,
	},
	{
		"alexanderbluhm/black.nvim",
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
		"Mofiqul/vscode.nvim",
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
		transparent = true,
	},
}
