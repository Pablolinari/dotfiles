return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = '│',  -- Cambia este carácter por uno más fino si es necesario
        }
    },
    config = function()
        local hooks = require "ibl.hooks"
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#E5E9F0" })  -- Ajusta el color según tu esquema de colores
        end)
        require("ibl").setup {
            indent = {
                char = '│',  -- Cambia este carácter por uno más fino si es necesario
            }
        }
    end
}
