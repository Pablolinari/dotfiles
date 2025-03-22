return{
{
  "Shatur/neovim-ayu",
  priority = 1000, -- Ensure it loads first
},
{
  'projekt0n/github-nvim-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup({
      -- ...
    })

  end,
},
{
    -- Plugin for the Kanagawa color scheme
    "rebelot/kanagawa.nvim",
    priority = 1000, -- High priority to ensure it loads early
},

{
	"catppuccin/nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
      -- ...
  end,
	},

  {
    "folke/tokyonight.nvim",
		priority =1000,
  },
  {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
  }
}

