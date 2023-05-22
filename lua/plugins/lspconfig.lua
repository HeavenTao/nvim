return {
    "neovim/nvim-lspconfig",
    config = function()
        require("lsp.lua").setup()
        require("lsp.python").setup()
    end
}
