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
vim.keymap.set('i','jk','<ESC>',{silent=true})
vim.keymap.set({'i','v'},'<ESC>','<nop>',{silent=true})
vim.keymap.set('v','<localleader>jk','<ESC>',{silent=true})
vim.keymap.set('n','<localleader><localleader>',':noh<cr>',{silent=true})
vim.keymap.set('n','<leader>q',':q<cr>',{silent=true})
vim.keymap.set('n','<S-W>','<C-W>W',{silent=true})
vim.keymap.set('n','<leader>w',':w<cr>')
vim.keymap.set('n','<leader>ev',':100vsplit $MYVIMRC<cr>')
vim.keymap.set('n','<leader>sv',':source $MYVIMRC<cr>')
vim.keymap.set('n','<leader>ss',':source %<cr>')
vim.keymap.set('n','/','/\\v')
