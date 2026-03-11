return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = "VeryLazy", -- Se carga casi al inicio para no retrasar el arranque
  opts = {
    options = {
      mode = "buffers", -- Usa "tabs" si prefieres pestañas reales de Neovim
      style_preset = "default",
      separator_style = "slant", -- Opciones: "slant", "slope", "thick", "thin"
      
      -- Iconos y estética
      show_buffer_close_icons = true,
      show_close_icon = false,
      diagnostics = "nvim_lsp", -- Muestra iconos de error/advertencia si usas LSP
      
      -- Comportamiento con exploradores de archivos
      offsets = {
        {
          filetype = "oil",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
      
      -- Para que las pestañas no se muevan de forma extraña
      always_show_bufferline = true,
      sort_by = 'insert_after_current',
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)

    -- MAPEOS DE TECLADO ÚTILES
    -- Moverse entre pestañas con Shift + L o H
    vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Siguiente pestaña" })
    vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Pestaña anterior" })
    
    -- Cerrar la pestaña actual (Buffer)
    vim.keymap.set("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Cerrar pestaña actual" })
    
    -- Mover pestañas de posición
    vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineMoveNext<cr>", { desc = "Mover pestaña a la derecha" })
    vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineMovePrev<cr>", { desc = "Mover pestaña a la izquierda" })
  end,
}
