return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>n", "<cmd>Neotree source=filesystem position=float toggle=true reveal=true<cr>", "Neotree toggle" }
    },
    config = function()
        vim.fn.sign_define("DiagnosticSignError",
            { text = " ", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DiagnosticSignWarn",
            { text = " ", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignInfo",
            { text = " ", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignHint",
            { text = "󰌵", texthl = "DiagnosticSignHint" })

        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                use_libuv_file_watcher = false,
                window = {
                    mappings = {
                        ["l"] = {
                            "toggle_node"
                        },
                        ["h"] = {
                            "close_node"
                        },
                    }
                }
            },
        })
    end
}