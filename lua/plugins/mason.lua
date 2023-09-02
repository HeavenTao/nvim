return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
        { "williamboman/mason-lspconfig.nvim" }
    },
    enabled = true,
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "html",
                "jsonls",
                "lua_ls",
                "pyright"
            }
        }
    end,
}
