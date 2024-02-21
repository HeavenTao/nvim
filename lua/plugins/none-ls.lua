return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                --python
                null_ls.builtins.formatting.black,
                --bash
                null_ls.builtins.formatting.beautysh
            }
        })
    end
}