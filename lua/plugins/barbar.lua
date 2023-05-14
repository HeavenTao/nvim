return {
    "romgrk/barbar.nvim",
    lazy = false,
    config = function()
        vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })

        require('barbar').setup({
            animation = false,
            auto_hide = true,
            clickable = false,
        })
    end
}
