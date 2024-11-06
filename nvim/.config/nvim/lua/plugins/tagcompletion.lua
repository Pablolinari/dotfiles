
return {
  -- Aquí van otros plugins de LazyVim

  -- Autocompletado y soporte de lenguaje para HTML en JavaScript
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      -- Configura coc.nvim para JavaScript y HTML
      vim.cmd([[
        let g:coc_global_extensions = ['coc-html', 'coc-tsserver']
      ]])
    end,
  },

  -- Cierre automático de etiquetas HTML
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = { "html", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" },
      })
    end,
  },
}
