return {
  -- 1. Motor de Copilot (Sugerencias automáticas)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<M-l>", -- Alt + l para aceptar la sugerencia
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = false },
      })
    end,
  },

  -- 2. Interfaz de Chat con el mapeo <leader>c
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" }, -- Dependencia para manejar datos
    },
    opts = {
      debug = false, -- Cambia a true si tienes problemas
      -- Aquí puedes personalizar la ventana (float, vertical, etc.)
      window = {
        layout = 'vertical', -- 'vertical', 'horizontal', 'float'
        width = 0.4, -- 40% del ancho de la pantalla
      },
    },
    keys = {
      {
        "<leader>c",
        function()
          require("CopilotChat").toggle()
        end,
        desc = "CopilotChat - Toggle",
        mode = { "n", "v" }, -- Funciona en modo normal y visual (para preguntar sobre código seleccionado)
      },
    },
  },
}
