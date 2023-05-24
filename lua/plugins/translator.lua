return {
    "voldikss/vim-translator",
    config = function()
        vim.keymap.set('n', '<leader>t', "<Plug>Translate", { silent = true, noremap = true })
        vim.keymap.set('v', '<leader>t', "<Plug>TranslateV", { silent = true, noremap = true })
    end
}
