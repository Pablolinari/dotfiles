return{
  'chomosuke/typst-preview.nvim',
  lazy = false, -- or ft = 'typst'
  version = '1.*',
  opts = {
		follower = "zathura"
	}, -- lazy.nvim will implicitly calls `setup {}`
}
