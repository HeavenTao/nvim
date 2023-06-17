local opt = { silent = true, noremap = true }
--用jk代替ESC
vim.keymap.set("i", "jk", "<ESC>", opt)
--禁用ESC
vim.keymap.set({ "i", "v" }, "<ESC>", "<nop>", opt)
--取消选择
vim.keymap.set("v", "<localleader><localleader>", "<ESC>", opt)
--取消高亮
vim.keymap.set("n", "<localleader><localleader>", ":noh<cr>", opt)
--退出
vim.keymap.set("n", "<leader>q", ":q<cr>", opt)
--窗口切换
--vim.keymap.set('n', '<S-W>', '<C-W>W', opt)
vim.keymap.set("n", "<A-l>", "<C-W>l", opt)
vim.keymap.set("n", "<A-h>", "<C-W>h", opt)
vim.keymap.set("n", "<A-j>", "<C-W>j", opt)
vim.keymap.set("n", "<A-k>", "<C-W>k", opt)
--保存
vim.keymap.set("n", "<leader>w", ":wall<cr>")
--编辑配置文件
vim.keymap.set("n", "<leader>ev", ":edit $MYVIMRC<cr>")
--加载配置文件
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<cr>")
--加载当前文件
vim.keymap.set("n", "<leader>ss", ":source %<cr>")
--使用正常的正则表达式
vim.keymap.set("n", "/", "/\\v")
--使用4个空格代替tab
vim.keymap.set("i", "<Tab>", "    ")

--copilot
vim.keymap.set(
    "i",
    "<M-CR>",
    'copilot#Accept("<CR>")',
    { expr = true, noremap = true, silent = true, script = true, replace_keycodes = false }
)
vim.g.copilot_no_tab_map = true
