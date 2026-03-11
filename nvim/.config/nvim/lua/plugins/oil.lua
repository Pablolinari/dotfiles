return {
  'stevearc/oil.nvim',
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  config = function()
    require("oil").setup({
      -- 1. CONFIGURACIÓN VISUAL (FLOTANTE)
      float = {
        padding = 2,
        max_width = 0.8,
        max_height = 0.8,
        border = "rounded",
        win_options = {
          winblend = 10,
        },
      },
      -- 2. VER ARCHIVOS OCULTOS
      view_options = {
        -- Muestra archivos que empiezan con "." (dotfiles)
        show_hidden = true,
        -- Puedes filtrar qué archivos NO quieres ver nunca (opcional)
        is_always_hidden = function(name, bufnr)
          return name == ".." -- Oculta el directorio superior para que sea más limpio
        end,
      },
      -- 3. INFORMACIÓN ÚTIL (COLUMNAS)
      -- Aquí definimos qué ver junto al nombre: permisos, tamaño y fecha
      default_file_explorer = true,
    })

    -- Mapeo para abrir Oil directamente en modo flotante
  end,
}
