return {
    "neovim/nvim-lspconfig",
    dependencies = {
        --"williamboman/mason.nvim",
        --"williamboman/mason-lspconfig.nvim"
    },
    config = function()
        -- Set up lspconfig.
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("lsp.lua").setup(capabilities)
        require("lsp.python").setup(capabilities)
        require("lsp.html").setup(capabilities)
        require("lsp.tsserver").setup(capabilities)
        require("lsp.bash").setup(capabilities)
        require("lsp.json").setup(capabilities)
        require("lsp.css").setup(capabilities)

        vim.api.nvim_create_autocmd('LspAttach',
            {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    --vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.api.nvim_create_autocmd('BufWritePre',
                        {
                            buffer = ev.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = ev.buf })
                            end
                        }
                    )
                end
            }
        )
    end
}
