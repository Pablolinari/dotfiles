return{
  "xiyaowong/transparent.nvim",
  -- Asegúrate de que este plugin se cargue *después* de que se establezca el colorscheme.
  config = function()
    require("transparent").setup({
      -- opciones predeterminadas
      extra_groups = {}, -- lista de grupos adicionales para hacer transparentes
      exclude = {},      -- lista de grupos para *excluir* de la transparencia
    })
    -- Llama a la función para habilitar la transparencia
    vim.cmd.TransparentEnable()
  end
}
