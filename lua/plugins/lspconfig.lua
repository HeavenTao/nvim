return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "folke/neodev.nvim",
    },
    config = function()
        require("neodev").setup()

        local lspconfig = require("lspconfig")
        -- Set up lspconfig.
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }
        -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
        -- lua_ls
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                        },
                    },
                    diagnostics = {
                        globals = {
                            "vim",
                        },
                    },
                    completion = {
                        callSnippet = "Replace",
                    },
                },
            },
        })

        --bash_ls
        lspconfig.bashls.setup({
            capabilities = capabilities,
        })

        --css_ls
        lspconfig.cssls.setup({
            capabilities = capabilities,
        })

        --html_ls
        lspconfig.html.setup({
            capabilities = capabilities,
            --init_options = {
            --configurationSection = { "html", "css", "javascript" },
            --embeddedLanguages = {
            --css = true,
            --javascript = true,
            --},
            --provideFormatter = true,
            --},
        })

        --json_ls
        lspconfig.jsonls.setup({
            capabilities = capabilities,
        })

        --javascript_ls
        lspconfig.tsserver.setup({
            capabilities = capabilities,
        })

        --python
        lspconfig.pyright.setup({
            capabilities = capabilities,
        })

        --c
        lspconfig.clangd.setup({
            capabilities = capabilities,
        })

        --vue
        --lspconfig.vuels.setup({
        --capabilities = capabilities,
        --})
        lspconfig.volar.setup({
            capabilities = capabilities,
            filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
            init_options = {
                vue = {
                    hybridMode = false,
                },
                typescript = {
                    tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
                },
            },
        })

        --svelte
        lspconfig.svelte.setup({
            capabilities = capabilities,
        })

        --rust
        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
        })

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

				--vim.api.nvim_create_autocmd("BufWritePre", {
				--buffer = ev.buf,
				--callback = function()
				--vim.lsp.buf.format { bufnr = ev.buf, async = false }
				--end
				--})
			end,
		})
	end,
}
