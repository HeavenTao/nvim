require "nvchad.options"

vim.loader.enable()
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.ttimeoutlen = 0
vim.o.timeout = false
vim.o.scrolloff = 5
vim.o.showcmd = false
vim.o.relativenumber = true
vim.o.cursorlineopt = "both"
vim.o.numberwidth = 4

-- add yours here!

-- Match prettier tabWidth=4 for JS/TS/HTML/CSS/Vue files
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "jsonc",
    "html",
    "css",
    "scss",
    "vue",
  },
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end,
})

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

vim.g.have_nerd_font = true
