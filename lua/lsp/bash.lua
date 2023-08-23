return {
    setup = function(capabilities)
        require("lspconfig").bashls.setup({
            capabilities = capabilities
        })
    end
}
