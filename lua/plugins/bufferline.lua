return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "BufEnter",
    keys = {
        { "<A-,>", "<cmd>BufferLineCyclePrev<cr>",       "BufferLineCyclePrev" },
        { "<A-.>", "<cmd>BufferLineCycleNext<cr>",       "BufferLineCycleNext" },
        { "<A-c>", "<cmd>bdelete<cr>",                   "BufferDelete" },
        { "<A-[>", "<cmd>BufferLineMovePrev<cr>",        "BufferLineMovePrev" },
        { "<A-]>", "<cmd>BufferLineMoveNext<cr>",        "BufferLineMoveNext" },
        { "<A-p>", "<cmd>BufferLineTogglePin<cr>",       "BufferLineTogglePin" },
        { "<A-s>", "<cmd>BufferLineSortByDirectory<cr>", "BufferLineSortByDirectory" },
        { "<A-f>", "<cmd>BufferLinePick<cr>",            "BufferLinePick" },
    },
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                separator_style = "slant",
                themable = true,
                close_command = "bdelete! %d",
                mode = "buffers",
                diagnostics = "nvim_lsp",
                hover = {
                    enable = false,
                    delay = 200,
                    reveal = { "close" }
                },
                sort_by = "relative_directory",
                indicator = {
                    style = "underline"
                }
            }
        })
    end
}
