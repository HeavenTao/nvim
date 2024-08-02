-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

-- cursor move
map({ "n", "v" }, "g0", "^", { desc = "Move cursor to first" })
map({ "n", "v" }, "gm", "$", { desc = "Move cursor to last" })

-- esc
map({ "i" }, "jk", "<esc>", { desc = "exit" })

--move to window
map({ "n" }, "<A-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map({ "n" }, "<A-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map({ "n" }, "<A-k>", "<C-w>k", { desc = "Go to up window", remap = true })
map({ "n" }, "<A-l>", "<C-w>l", { desc = "Go to right window", remap = true })

--buffers
map({ "n" }, "<A-,>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map({ "n" }, "<A-.>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map({ "n" }, "<A-]>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Prev Buffer" })
map({ "n" }, "<A-[>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Prev Buffer" })
map({ "n" }, "<A-c>", LazyVim.ui.bufremove, { desc = "Move Prev Buffer" })

--save file
map({ "i", "n", "x", "s" }, "<leader>w", "<cmd>wall<cr><esc>", { desc = "Save all file" })

-- comment
-- map({ "n" }, "<leader>cc", "<cmd>normal gcc<cr>", { desc = "Comment" })

--lazygit
map({ "n" }, "<leader>g", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "LazyGit" })
