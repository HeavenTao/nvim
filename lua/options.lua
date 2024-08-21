require "nvchad.options"

vim.o.timeoutlen = 300
vim.o.shiftwidth=4
vim.o.tabstop=4
vim.softtabstop=4
-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
if vim.g.neovide then
  vim.g.neovide_cursor_trail_size = 0
end

vim.g.vscode_snippets_path = vim.fn.stdpath('config') .. '/lua/snippets/'
