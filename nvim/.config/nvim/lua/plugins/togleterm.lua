return{
  'akinsho/toggleterm.nvim',
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-y>]], -- Ctrl + \ para abrir/cerrar
      direction = 'horizontal',      -- Estilo flotante como lazygit
      close_on_exit = true,     -- Se cierra al terminar el comando
    })
  end
}
