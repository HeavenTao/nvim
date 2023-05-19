local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
return {
    "jose-elias-alvarez/null-ls.nvim",
    --enabled=false,
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                --python formatter
                null_ls.builtins.formatting.black,
                --lua formatter
                null_ls.builtins.formatting.stylua.with({
                    extra_args = { "--indent-type", "Spaces", "--indent-width", "4" },
                }),
                null_ls.builtins.completion.luasnip.with({
                    filetypes = { "lua" },
                }),
                --json formatter
                null_ls.builtins.formatting.jq,
            },
            --aotoformat when save
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end,
        })
    end,
}
