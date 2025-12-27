return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    -- Ensure opencode is in PATH
    vim.env.PATH = vim.env.HOME .. "/.opencode/bin:" .. vim.env.PATH

    ---@type opencode.Opts
    vim.g.opencode_opts = {
      provider = {
        enabled = "snacks",
        snacks = {
          win = {
            position = "left",
          },
        },
      },
    }

    -- Required for buffer reloading when opencode edits files
    vim.o.autoread = true

    -- Keymaps
    vim.keymap.set({ "n", "t" }, "<leader>cc", function()
      require("opencode").toggle()
    end, { desc = "Toggle OpenCode" })

    vim.keymap.set({ "n", "x" }, "<leader>cs", function()
      require("opencode").select()
    end, { desc = "OpenCode select" })

    vim.keymap.set({ "n", "x" }, "<leader>ci", function()
      require("opencode").ask("")
    end, { desc = "OpenCode ask" })

    vim.keymap.set({ "n", "x" }, "<leader>cI", function()
      require("opencode").ask("@this: ")
    end, { desc = "OpenCode ask with context" })

    vim.keymap.set({ "n", "x" }, "<leader>cb", function()
      require("opencode").ask("@buffer ")
    end, { desc = "OpenCode ask about buffer" })

    vim.keymap.set({ "n", "x" }, "<leader>cp", function()
      require("opencode").prompt("@this")
    end, { desc = "OpenCode prompt" })

    -- Built-in prompts
    vim.keymap.set({ "n", "x" }, "<leader>cpe", function()
      require("opencode").prompt("explain")
    end, { desc = "OpenCode explain" })

    vim.keymap.set({ "n", "x" }, "<leader>cpf", function()
      require("opencode").prompt("fix")
    end, { desc = "OpenCode fix" })

    vim.keymap.set({ "n", "x" }, "<leader>cpd", function()
      require("opencode").prompt("diagnostics")
    end, { desc = "OpenCode diagnose" })

    vim.keymap.set({ "n", "x" }, "<leader>cpr", function()
      require("opencode").prompt("review")
    end, { desc = "OpenCode review" })

    vim.keymap.set({ "n", "x" }, "<leader>cpt", function()
      require("opencode").prompt("test")
    end, { desc = "OpenCode test" })

    vim.keymap.set({ "n", "x" }, "<leader>cpo", function()
      require("opencode").prompt("optimize")
    end, { desc = "OpenCode optimize" })

    -- Operator for ranges (optional)
    vim.keymap.set({ "n", "x" }, "go", function()
      return require("opencode").operator("@this ")
    end, { expr = true, desc = "Add range to opencode" })

    vim.keymap.set("n", "goo", function()
      return require("opencode").operator("@this ") .. "_"
    end, { expr = true, desc = "Add line to opencode" })
  end,
}
