return {
    "williamboman/mason.nvim",
    build=":MasonUpdate",
    denpendencies={
        {"williamboman/mason-lspconfig.nvim"}
    },
    config=function()
        require("mason").setup()
    end
}
