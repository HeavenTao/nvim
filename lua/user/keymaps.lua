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
vim.keymap.set('n', '<leader>ev', ':edit $MYVIMRC<cr>')
--加载配置文件
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<cr>')
--加载当前文件
vim.keymap.set('n', '<leader>ss', ':source %<cr>')
--使用正常的正则表达式
vim.keymap.set('n', '/', '/\\v')
--使用4个空格代替tab
vim.keymap.set('i', '<Tab>', '    ')
