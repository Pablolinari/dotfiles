return {
	{
		"vague2k/vague.nvim",
		priority = 1000,
		config = function()
			require("vague").setup({ transparent = true })
		end
	},
	{
		"TheNiteCoder/mountaineer.vim",
		lazy = false,
		priority = 1000,
	},
	{
		"thimc/gruber-darker.nvim",
		priority = 1000,
	},
	{
		"danilo-augusto/vim-afterglow",
		priority = 1000,
	},
	{
		'Mofiqul/vscode.nvim',
		priority = 1000,

	},
	{
		"morhetz/gruvbox",
		priority = 1000,
	},
	{
		"Shatur/neovim-ayu",
		priority = 1000, -- Ensure it loads first
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false,  -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
			})
		end,
	},
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

	{
		"catppuccin/nvim",
		lazy = false,  -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- ...
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,

	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
	},
}
