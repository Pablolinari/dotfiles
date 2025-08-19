return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    lualine.setup({})

    -- Aplica transparencia después de cargar todo
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        local highlights = {
          "lualine_a_normal", "lualine_b_normal", "lualine_c_normal",
          "lualine_a_insert", "lualine_b_insert", "lualine_c_insert",
          "lualine_a_visual", "lualine_b_visual", "lualine_c_visual",
          "lualine_a_replace", "lualine_b_replace", "lualine_c_replace",
          "lualine_a_command", "lualine_b_command", "lualine_c_command",
          "lualine_a_inactive", "lualine_b_inactive", "lualine_c_inactive"
        }
        for _, group in ipairs(highlights) do
          vim.cmd("highlight " .. group .. " guibg=NONE")
        end
      end,
    })

    -- Aplica los highlights al inicio por si acaso
    local highlights = {
      "lualine_a_normal", "lualine_b_normal", "lualine_c_normal",
      "lualine_a_insert", "lualine_b_insert", "lualine_c_insert",
      "lualine_a_visual", "lualine_b_visual", "lualine_c_visual",
      "lualine_a_replace", "lualine_b_replace", "lualine_c_replace",
      "lualine_a_command", "lualine_b_command", "lualine_c_command",
      "lualine_a_inactive", "lualine_b_inactive", "lualine_c_inactive"
    }
    for _, group in ipairs(highlights) do
      vim.cmd("highlight " .. group .. " guibg=NONE")
    end
  end,
}
