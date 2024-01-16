vim.g.mapleader = "," -- 功能键
vim.g.maplocalleader = "\\" --第二功能键
vim.opt.number = true --显示行号
vim.opt.relativenumber = true --相对行号
vim.opt.clipboard:append({ "unnamedplus" }) --+寄存器成为默认使用的寄存器
vim.opt.number = true --显示行号
vim.opt.hlsearch = true --高亮查找
vim.opt.incsearch = true --增量查找
vim.opt.ignorecase = true --查找忽略大小写
vim.opt.timeoutlen = 300 --按键间隔
vim.opt.shiftwidth = 4 --
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true --将Tab展开为Space
vim.opt.encoding = "UTF-8"
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10
vim.opt.termguicolors = true

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
