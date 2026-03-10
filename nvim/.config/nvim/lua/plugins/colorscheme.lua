return {
	{
		"vague2k/vague.nvim",
		priority = 1000,
		config = function()
			require("vague").setup({ transparent = true })
		end
	},
	{
		"thimc/gruber-darker.nvim",
		priority = 1000,
	},
	{
		"yorickpeterse/nvim-grey",
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
		"folke/tokyonight.nvim",
		priority = 1000,
	},
}
