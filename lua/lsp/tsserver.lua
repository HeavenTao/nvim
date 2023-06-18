return {
    setup = function(capabilities)
        require("lspconfig").tsserver.setup({
            capabilities = capabilities
        })
    end
}
