return {
    "akinsho/toggleterm.nvim",
    config = function()
        require('toggleterm').setup {
            size = 10,
            open_mapping = [[<c-\>]],
            insert_mappings = true,
            terminal_mappings = true,
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = false,
            shading_factor = 2,
            start_in_insert = true,
            persist_size = true,
            persist_mode = true,
            direction = "horizontal",
            close_on_exit = true,
            auto_scroll = true,
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            }
        }
    end
}
