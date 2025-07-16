return {
{
  "vague2k/vague.nvim",
		priority=1000,
		config =function ()
			require("vague").setup({transparent =true})
			
		end
},
	{
		"slugbyte/lackluster.nvim",
		priority = 1000,
	},
	{
		"Shatur/neovim-ayu",
		priority = 1000, -- Ensure it loads first
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
				-- ...
			})
		end,
	},
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

	{
		"catppuccin/nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- ...
		end,
	},
  {
		"rebelot/kanagawa.nvim",
	
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
	},
}
