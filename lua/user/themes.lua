--主題設置
if vim.fn.has('termguicolors') ~= 0 then
    vim.o.termguicolors = true
end
vim.o.background = 'dark'
vim.g.everforest_background = 'soft'
vim.g.everforest_better_performance = 1
vim.cmd.colorscheme('everforest')
