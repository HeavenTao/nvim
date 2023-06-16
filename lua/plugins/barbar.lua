return {
    "romgrk/barbar.nvim",
    --lazy = false,
    config = function()
        local opt = { noremap = true, silent = true }
        vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opt)
        vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', opt)
        vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', opt)
        vim.keymap.set('n', '<C-,>', '<Cmd>BufferMovePrevious<CR>', opt)
        vim.keymap.set('n', '<C-.>', '<Cmd>BufferMoveNext<CR>', opt)

        require('barbar').setup({
            animation = false,
            auto_hide = true,
            clickable = false,
        })
    end
}
