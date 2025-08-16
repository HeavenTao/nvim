require "nvchad.options"

vim.o.ttimeoutlen = 0
vim.o.timeout = false
vim.o.scrolloff = 5
vim.o.showcmd = true
vim.o.relativenumber = true
vim.o.cursorlineopt = "both"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
if vim.g.neovide then
  vim.g.neovide_cursor_trail_size = 0
end

-- zig settings
vim.g.zig_fmt_parse_errors = 0
vim.g.zig_fmt_autosave = 0

--snippets
vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets/"

vim.g.loaded_node_provider = nil

--clipboard
local tmux = os.getenv "TMUX"
if tmux then
  vim.g.clipboard = "tmux"
end
