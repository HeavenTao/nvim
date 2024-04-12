local opt = { silent = true, noremap = true }
--用jk代替ESC
vim.keymap.set("i", "jk", "<ESC>", opt)
--退出
vim.keymap.set("n", "<leader>q", ":q<cr>", opt)
--vim.keymap.set("n", "Q", ":qall<cr>", opt)
--取消高亮
vim.keymap.set("n", "<ESC>", ":noh<cr>", opt)
--窗口切换
vim.keymap.set("n", "<A-l>", "<C-W>l", opt)
vim.keymap.set("n", "<A-h>", "<C-W>h", opt)
vim.keymap.set("n", "<A-j>", "<C-W>j", opt)
vim.keymap.set("n", "<A-k>", "<C-W>k", opt)
--保存
vim.keymap.set("n", "<leader>w", ":wall<cr>")
--使用4个空格代替tab
--vim.keymap.set("i", "<Tab>", "    ")
--行首行尾移动
vim.keymap.set("n", "g0", "^", opt)
vim.keymap.set("n", "gm", "$", opt)
--virtual模式行首行尾选中
vim.keymap.set("v", "g0", "^", opt)
vim.keymap.set("v", "gm", "$", opt)
