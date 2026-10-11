return {
  "3rd/image.nvim",
  opts = {
    backend = "kitty", -- Se detecta automáticamente en la mayoría de terminales compatibles (Kitty, Ghostty, WezTerm)
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
      },
      neorg = {
        enabled = true,
      },
      html = {
        enabled = true,
      },
      css = {
        enabled = true,
      },
    },
    max_width = 100,
    max_height = 12,
    max_height_window_percentage = 50,
    window_overlap_clear_enabled = false,
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  },
}
