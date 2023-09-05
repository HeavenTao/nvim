return {
    setup = function(capabilities)
        require("lspconfig").cssls.setup({
            capabilities = capabilities
        })
    end
}
