return {
    "nvim-telescope/telescope.nvim",
    version = "0.1.1",
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    lazy = false,
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>f', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
}
