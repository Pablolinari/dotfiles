return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup({
      window = {
        split_ratio = 0.35,          -- Ancho de la ventana (35% de la pantalla)
        position = "vertical botright", -- Split vertical en el lateral derecho
        enter_insert = true,
        hide_numbers = true,
        hide_signcolumn = true,
      },
      keymaps = {
        toggle = {
          normal = "<leader>cc",   -- <leader>cc abre / cierra Claude
          terminal = "<leader>cc", -- también funciona desde dentro de la terminal
        },
      },
    })
  end,
}
