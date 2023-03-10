--plugin
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'sainnhe/everforest'
    use {
        'nvim-telescope/telescope.nvim',tag='0.1.1',
        requires={{'nvim-lua/plenary.nvim'}}
    }
    use 'nvim-tree/nvim-web-devicons'
end)

--使用+寄存器
vim.opt.clipboard:append{'unnamedplus'}
--高亮查找
vim.o.hlsearch=true
--增量查找
vim.o.incsearch=true
--显示行号
vim.o.number=true
--查找忽略大小写
vim.o.ignorecase=true
--
vim.o.timeoutlen=300
--
vim.o.softtabstop=4
--
vim.o.shiftwidth=4
--
vim.o.smartindent=true
--
vim.o.expandtab=true
--
vim.o.encoding='UTF-8'
--设置鼠标所在行高亮
vim.o.cursorline=true
--设置leader
vim.g.mapleader=','
vim.g.localmapleader='\\'

--map setting
--用jk代替ESC
vim.keymap.set('i','jk','<ESC>',{silent=true})
--禁用ESC
vim.keymap.set({'i','v'},'<ESC>','<nop>',{silent=true})
--取消选择
vim.keymap.set('v','<localleader><localleader>','<ESC>',{silent=true})
--取消高亮
vim.keymap.set('n','<localleader><localleader>',':noh<cr>',{silent=true})
--退出
vim.keymap.set('n','<leader>q',':q<cr>',{silent=true})
--窗口切换
vim.keymap.set('n','<S-W>','<C-W>W',{silent=true})
--保存
vim.keymap.set('n','<leader>w',':w<cr>')
--编辑配置文件
vim.keymap.set('n','<leader>ev',':100vsplit $MYVIMRC<cr>')
--加载配置文件
vim.keymap.set('n','<leader>sv',':source $MYVIMRC<cr>')
--加载当前文件
vim.keymap.set('n','<leader>ss',':source %<cr>')
--使用正常的正则表达式
vim.keymap.set('n','/','/\\v')

--主題設置
if vim.fn.has('termguicolors')~=0 then
    vim.o.termguicolors=true
end
vim.o.background='dark'
vim.g.everforest_background='soft'
vim.g.everforest_better_performance=1
vim.cmd.colorscheme('everforest')

--telescopt.nvim
local builtin=require('telescope.builtin')
vim.keymap.set('n','<leader>f',builtin.find_files,{})
vim.keymap.set('n','<leader>fg',builtin.live_grep,{})
vim.keymap.set('n','<leader>fb',builtin.buffers,{})
vim.keymap.set('n','<leader>fh',builtin.help_tags,{})

-- coc-explorer
vim.keymap.set('n','<leader>n',':CocCommand explorer<cr>')

--coc-nvim


