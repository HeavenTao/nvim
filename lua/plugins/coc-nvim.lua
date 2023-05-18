vim.g.coc_global_extensions = { "coc-explorer" }
vim.g.coc_config_home = "~/.config/coc/"

return {
    "neoclide/coc.nvim",
    branch = "release",
    --lazy = false,
    config = function()
        --coc settings
        --vim.opt.backup = false
        --vim.opt.writebackup = false
        --vim.opt.updatetime = 300
        --vim.opt.signcolumn = 'yes'
        --function _G.check_back_space()
        --local col = vim.fn.col(".") - 1
        --return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
        --end

        --local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
        --vim.keymap.set('i', "<C-j>",
        --'coc#pum#visible()?coc#pum#next(1) : v:lua.check_back_space() ? "TAB" : coc#refresh()', opts)
        --vim.keymap.set('i', '<C-k>', [[coc#pum#visible()?coc#pum#prev(1):"\<C-h>"]], opts)
        --vim.keymap.set('i', '<TAB>', [[coc#pum#visible()?coc#pum#confirm():"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
        --opts)
        --vim.keymap.set('n', "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
        --vim.keymap.set('n', ']g', "<Plug>(coc-diagnostic-next)", { silent = true })

        --vim.keymap.set('n', 'gd', "<Plug>(coc-definition)", { silent = true })
        --vim.keymap.set('n', 'gy', "<Plug>(coc-type-definition)", { silent = true })
        --vim.keymap.set('n', 'gi', "<Plug>(coc-implementation)", { silent = true })
        --vim.keymap.set('n', 'gr', "<Plug>(coc-references)", { silent = true })

        --function _G.show_docs()
        --local cw = vim.fn.expand('<cword>')
        --if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        --vim.api.nvim_command('h ' .. cw)
        --elseif vim.api.nvim_eval('coc#rpc#ready()') then
        --vim.fn.CocActionAsync('doHover')
        --else
        --vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        --end
        --end

        --vim.keymap.set('n', 'K', '<CMD>lua _G.show_docs()<cr>', { silent = true })
        --vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })

        --vim.keymap.set("i", "<C-f>", 'coc#float#has_scroll()?"<c-r>=coc#float#scroll(1)<cr>":"<Right>"',
        --{ silent = true, noremap = true, expr = true, replace_keycodes = false })
        --vim.keymap.set("i", "<C-b>", 'coc#float#has_scroll()?"<c-r>=coc#float#scroll(0)<cr>":"<Left>"',
        --{ silent = true, noremap = true, expr = true, replace_keycodes = false })

        ----coc-explorer settings--
        vim.keymap.set("n", "<leader>n", ":CocCommand explorer<cr>")
    end,
}
