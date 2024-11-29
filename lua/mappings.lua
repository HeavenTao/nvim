-- require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("i", "jk", "<ESC>", { desc = "Normal mode" })

--window dir
map("n", "<A-l>", "<C-W>l", { desc = "Window Right" })
map("n", "<A-h>", "<C-W>h", { desc = "Window Left" })
map("n", "<A-j>", "<C-W>j", { desc = "Window Down" })
map("n", "<A-k>", "<C-W>k", { desc = "Window Up" })

--edit move
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

--Clear highlights
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

--Save all
map("n", "<leader>ww", "<cmd>wall<CR>", { desc = "General Save file" })

--NvCheatsheet
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Toggle nvcheatsheet" })

--Format
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "General Format file" })

--Tabline
map("n", "<A-,>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Tab Left" })

map("n", "<A-.>", function()
  require("nvchad.tabufline").next()
end, { desc = "Tab Left" })

map("n", "<A-c>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Tab buffer close" })

map("n", "<A-[>", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "Tab Move Left" })

map("n", "<A-]>", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "Tab Move Right" })

-- Comment
map("n", "<leader>cc", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>cc", "gc", { desc = "Toggle comment", remap = true })

-- nvimtree
map("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
-- map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
-- map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
--map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
-- map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
--map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })

-- terminal
map("t", "<C-q>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
-- map("n", "<leader>h", function()
--   require("nvchad.term").new { pos = "sp" }
-- end, { desc = "terminal new horizontal term" })
--
-- map("n", "<leader>v", function()
--   require("nvchad.term").new { pos = "vsp" }
-- end, { desc = "terminal new vertical window" })
--
-- toggleable
-- map({ "n", "t" }, "<A-v>", function()
--   require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
-- end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal new horizontal term" })

map("t", "<ESC>", "<C-\\><C-N>", { desc = "terminal exit terminal mode" })

-- map({ "n", "t" }, "<A-i>", function()
--   require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
-- end, { desc = "terminal toggle floating term" })

-- whichkey
-- map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
--
-- map("n", "<leader>wk", function()
--   vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
-- end, { desc = "whichkey query lookup" })

-- blankline
-- map("n", "<leader>cc", function()
--   local config = { scope = {} }
--   config.scope.exclude = { language = {}, node_type = {} }
--   config.scope.include = { node_type = {} }
--   local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)
--
--   if node then
--     local start_row, _, end_row, _ = node:range()
--     if start_row ~= end_row then
--       vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
--       vim.api.nvim_feedkeys("_", "n", true)
--     end
--   end
-- end, { desc = "blankline jump to current context" })

--code runner
map("n", "<F5>", function()
  require("nvchad.term").runner {
    id = "htoggleTerm",
    pos = "sp",
    cmd = function()
      local file = vim.fn.expand "%"
      local outfile = "./debug/" .. vim.fn.expand "%:t:r"
      local ft_cmds = {
        c = "clang -o " .. outfile .. " -g " .. file .. " && " .. "./" .. outfile,
      }
      vim.print(ft_cmds[vim.bo.ft])
      return ft_cmds[vim.bo.ft]
    end,
  }
end, { desc = "Code Runner" })
