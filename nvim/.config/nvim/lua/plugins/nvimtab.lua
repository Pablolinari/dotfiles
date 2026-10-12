return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  opts = {
    options = {
      mode = "buffers",
      diagnostics = "nvim_lsp",
    },
  },
}
