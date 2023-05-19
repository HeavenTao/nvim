--使用+寄存器
vim.opt.clipboard:append({ "unnamedplus" })
--高亮查找
vim.o.hlsearch = true
--增量查找
vim.o.incsearch = true
--显示行号
vim.o.number = true
vim.o.relativenumber = true
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
vim.o.autoindent = true
--
vim.o.encoding = "UTF-8"
--设置鼠标所在行高亮
vim.o.cursorline = true
--设置leader
vim.g.mapleader = ","
vim.g.localmapleader = "\\"
--预留左边的距离
vim.o.signcolumn = 'yes'
