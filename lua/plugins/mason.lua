return {
    "williamboman/mason.nvim",
    build=":MasonUpdate",
    dependencies={
        {"williamboman/mason-lspconfig.nvim"}
    },
    config=function()
        require("mason").setup()
        require("mason-lspconfig").setup()
    end
}