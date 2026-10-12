return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- Empieza a guardar la sesión en cuanto se abre un archivo
  -- Los atajos van en `keys` para que funcionen también con nvim recién abierto
  -- (antes de leer ningún archivo, que es justo cuando se quiere restaurar)
  keys = {
    { "<leader>ts", function() require("persistence").load() end, desc = "Restaurar sesión" },
    { "<leader>tl", function() require("persistence").load({ last = true }) end, desc = "Restaurar última sesión" },
    { "<leader>tS", function() require("persistence").select() end, desc = "Elegir sesión" },
    { "<leader>td", function() require("persistence").stop() end, desc = "Detener guardado de sesión" },
  },
  opts = {
    need = 1, -- no guardar si no hay ningún archivo abierto (no pisa la sesión con una vacía)
    branch = true, -- una sesión distinta por rama de git (salvo main/master)
  },
  init = function()
    -- Qué se guarda en la sesión
    vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

    -- nvim-tree no se puede restaurar desde una sesión (deja una ventana vacía), se cierra antes de guardar
    vim.api.nvim_create_autocmd("User", {
      pattern = "PersistenceSavePre",
      callback = function()
        pcall(vim.cmd, "NvimTreeClose")
      end,
    })

    -- Restaurar automáticamente la sesión del directorio al abrir `nvim` sin argumentos
    local stdin = false
    vim.api.nvim_create_autocmd("StdinReadPre", {
      callback = function()
        stdin = true
      end,
    })
    vim.api.nvim_create_autocmd("VimEnter", {
      nested = true,
      callback = function()
        if vim.fn.argc(-1) == 0 and not stdin and vim.bo.filetype ~= "lazy" then
          require("persistence").load()
        end
      end,
    })
  end,
}
