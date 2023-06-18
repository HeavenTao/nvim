return {
    setup = function(capabilities)
        require("lspconfig").html.setup({
            capabilities = capabilities
        })
    end
}
