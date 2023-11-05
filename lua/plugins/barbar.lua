return {
    "romgrk/barbar.nvim",
    --lazy = false,
    config = function()
        local opt = { noremap = true, silent = true }
        vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opt)
        vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', opt)
        vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', opt)
        vim.keymap.set('n', '<A-[>', '<Cmd>BufferMovePrevious<CR>', opt)
        vim.keymap.set('n', '<A-]>', '<Cmd>BufferMoveNext<CR>', opt)
        vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', opt)
        vim.keymap.set('n', '<A-f>', '<Cmd>BufferPick<CR>', opt)


        require('barbar').setup({
            animation = false,
            auto_hide = false,
            clickable = false,
            hide = { extensions = true }
        })
    end
}
