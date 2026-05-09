return {
	{
		"ribru17/bamboo.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"bjarneo/aether.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"bjarneo/ethereal.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"bjarneo/hackerman.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"bjarneo/vantablack.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"bjarneo/white.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		priority = 1000,
	},
	{
		"sainnhe/everforest",
		lazy = true,
		priority = 1000,
	},
	{
		"kepano/flexoki-neovim",
		lazy = true,
		priority = 1000,
	},
	{
		"tahayvr/matteblack.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"loctvl842/monokai-pro.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"shaunsingh/nord.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		priority = 1000,
	},
	{
		"OldJobobo/miasma.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"OldJobobo/retro-82.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"omacom-io/lumon.nvim",
		lazy = true,
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
