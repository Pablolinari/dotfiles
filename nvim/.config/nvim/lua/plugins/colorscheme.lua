return {
	{
		"vague2k/vague.nvim",
		priority = 1000,
		config = function()
			require("vague").setup({ transparent = true })
		end
	},
	{
		"oskarnurm/koda.nvim",
		priority = 1000,
	},
	{
		"alexanderbluhm/black.nvim"

	},
{ "rjmacarthy/oscura-vscode.nvim" },
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
