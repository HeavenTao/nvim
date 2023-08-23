return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                --python
                null_ls.builtins.formatting.black,
                --nix
                null_ls.builtins.formatting.nixfmt,
                null_ls.builtins.code_actions.statix,
                null_ls.builtins.diagnostics.statix,
                --bash
                null_ls.builtins.formatting.beautysh
            }
        })
    end
}
