return {
    setup = function(capabilities)
        require("lspconfig").jsonls.setup({
            capabilities = capabilities
        })
    end
}
