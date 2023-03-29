--plugin
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use { 'neoclide/coc.nvim', branch = 'release' }
    use 'sainnhe/everforest'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'nvim-tree/nvim-web-devicons'
    --Toggleterm
    use 'akinsho/toggleterm.nvim'
    require('toggleterm').setup {
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = false,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = false,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        float_opts = {
            border = "curved",
            winblend = 0,
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        }
    }
    --lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    require('lualine').setup {
        options = {
            section_separators = { left = '', right = '' },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            }
        }
    }
    use 'preservim/nerdcommenter'
    use '/usr/local/src/v-trans/'
end)

--使用+寄存器
vim.opt.clipboard:append { 'unnamedplus' }
--高亮查找
vim.o.hlsearch = true
--增量查找
vim.o.incsearch = true
--显示行号
vim.o.number = true
--查找忽略大小写
vim.o.ignorecase = true
--
vim.o.timeoutlen = 300
--
vim.o.softtabstop = 4
--
vim.o.shiftwidth = 4
--
vim.o.smartindent = true
--
vim.o.expandtab = true
--
vim.o.encoding = 'UTF-8'
--设置鼠标所在行高亮
vim.o.cursorline = true
--设置leader
vim.g.mapleader = ','
vim.g.localmapleader = '\\'

--map setting
--用jk代替ESC
vim.keymap.set('i', 'jk', '<ESC>', { silent = true })
--禁用ESC
vim.keymap.set({ 'i', 'v' }, '<ESC>', '<nop>', { silent = true })
--取消选择
vim.keymap.set('v', '<localleader><localleader>', '<ESC>', { silent = true })
--取消高亮
vim.keymap.set('n', '<localleader><localleader>', ':noh<cr>', { silent = true })
--退出
vim.keymap.set('n', '<leader>q', ':q<cr>', { silent = true })
--窗口切换
vim.keymap.set('n', '<S-W>', '<C-W>W', { silent = true })
--保存
vim.keymap.set('n', '<leader>w', ':w<cr>')
--编辑配置文件
vim.keymap.set('n', '<leader>ev', ':100vsplit $MYVIMRC<cr>')
--加载配置文件
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<cr>')
--加载当前文件
vim.keymap.set('n', '<leader>ss', ':source %<cr>')
--使用正常的正则表达式
vim.keymap.set('n', '/', '/\\v')

--主題設置
if vim.fn.has('termguicolors') ~= 0 then
    vim.o.termguicolors = true
end
vim.o.background = 'dark'
vim.g.everforest_background = 'soft'
vim.g.everforest_better_performance = 1
vim.cmd.colorscheme('everforest')

--telescopt.nvim
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- coc-explorer
vim.keymap.set('n', '<leader>n', ':CocCommand explorer<cr>')

--coc-nvim
vim.g.coc_global_extensions = { "coc-vimlsp", "coc-json", "coc-explorer", "coc-sumneko-lua", "coc-pyright" }
vim.g.coc_config_home = '~/.config/coc/'
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.signcolumn = 'yes'
function _G.check_back_space()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
vim.keymap.set('i', "<C-j>", 'coc#pum#visible()?coc#pum#next(1) : v:lua.check_back_space() ? "TAB" : coc#refresh()', opts)
vim.keymap.set('i', '<C-k>', [[coc#pum#visible()?coc#pum#prev(1):"\<C-h>"]], opts)
vim.keymap.set('i', '<TAB>', [[coc#pum#visible()?coc#pum#confirm():"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
vim.keymap.set('n', "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
vim.keymap.set('n', ']g', "<Plug>(coc-diagnostic-next)", { silent = true })

vim.keymap.set('n', 'gd', "<Plug>(coc-definition)", { silent = true })
vim.keymap.set('n', 'gy', "<Plug>(coc-type-definition)", { silent = true })
vim.keymap.set('n', 'gi', "<Plug>(coc-implementation)", { silent = true })
vim.keymap.set('n', 'gr', "<Plug>(coc-references)", { silent = true })

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

vim.keymap.set('n', 'K', '<CMD>lua _G.show_docs()<cr>', { silent = true })
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })

--Translator
vim.keymap.set('n', '<leader>t', ':lua VTrans()<CR>')
vim.keymap.set('v', '<leader>t', ':lua VTransV()<CR>')
