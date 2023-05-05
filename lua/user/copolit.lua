vim.keymap.set('i', '<M-CR>', 'copilot#Accept("<CR>")',
    { expr = true, noremap = true, silent = true, script = true, replace_keycodes = false })
vim.g.copilot_no_tab_map = true
