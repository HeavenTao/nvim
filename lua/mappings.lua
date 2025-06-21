-- require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

-- map("i", "jk", "<ESC>", { desc = "Normal mode" })
map("i", "jk", function()
  vim.cmd "stopinsert"
  require("luasnip").unlink_current()
end, { desc = "Normal Mode", silent = true })

-- luasnip choice
map({ "i", "s" }, "<C-e>", function()
  local ls = require "luasnip"
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { desc = "luasnip choice" })

map("n", "g0", "g^", { desc = "move to head" })
map("n", "gm", "g$", { desc = "move to end" })

--hover
map("n", "K", function()
  vim.lsp.buf.hover { border = "single" }
end, { desc = "Show Hover" })

--window dir
map("n", "<A-l>", "<C-W>l", { desc = "Window Right" })
map("n", "<A-h>", "<C-W>h", { desc = "Window Left" })
map("n", "<A-j>", "<C-W>j", { desc = "Window Down" })
map("n", "<A-k>", "<C-W>k", { desc = "Window Up" })

--edit move
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })

--Clear highlights
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

--Save all
map("n", "<leader>ww", "<cmd>wall<CR>", { desc = "General Save file" })

--close neovim
map("n", "<leader>qq", "<cmd>qall<CR>", { desc = "Close neovim" })

--NvCheatsheet
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Toggle nvcheatsheet" })

--Format
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "General Format file" })

--buffers
map("n", "<A-,>", function()
  local cur_buf = vim.api.nvim_get_current_buf()
  if vim.bo[cur_buf].buftype ~= "terminal" then
    require("nvchad.tabufline").prev()
  end
end, { desc = "Buffer Left" })

map("n", "<A-.>", function()
  local cur_buf = vim.api.nvim_get_current_buf()
  if vim.bo[cur_buf].buftype ~= "terminal" then
    require("nvchad.tabufline").next()
  end
end, { desc = "Buffer Left" })

map("n", "<A-c>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer buffer close" })

map("n", "<A-[>", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "Buffer Move Left" })

map("n", "<A-]>", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "Buffer Move Right" })

-- tabs
map("n", "<A-n>", "<Cmd>tabnew<cr>", { desc = "new Tab" })

for i = 1, 9, 1 do
  map("n", string.format("<A-%s>", i), string.format("<Cmd>tabn %s<cr>", i), { desc = "switch to tab n" })
end

map("n", "<S-A-n>", "<Cmd>tabc<cr>", { desc = "Close current tab" })

-- Comment
map("n", "<leader>cc", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>cc", "gc", { desc = "Toggle comment", remap = true })

-- nvimtree
map("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
--map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
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
  vim.cmd "write"
  if vim.bo.ft == "lua" or vim.bo.ft == "vim" then
    local folders = vim.lsp.buf.list_workspace_folders()
    if #folders <= 0 then
      vim.print "echo 'no workspace folders'"
    else
      local paths = vim.split(folders[1], "/")
      local pluginName = paths[#paths]

      if require("lazy.core.config").plugins[pluginName]._.loaded ~= nil then
        vim.print "reload"
        vim.cmd("Lazy reload " .. pluginName)
      else
        vim.print "load"
        vim.cmd("Lazy load " .. pluginName)
      end
    end
  elseif vim.bo.ft == "javascript" then
    require("nvchad.term").runner {
      id = "htoggleTerm",
      pos = "sp",
      cmd = function()
        local file = vim.fn.expand "%:t"
        return "node " .. file
      end,
    }
  elseif vim.bo.ft == "c" then
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
  elseif vim.bo.ft == "zig" then
    require("nvchad.term").runner {
      id = "htoggleTerm",
      pos = "sp",
      cmd = function()
        local file = vim.fn.expand "%"
        vim.print(file)
        return "zig run " .. file
      end,
    }
  else
    vim.print "this filetype not set run command"
  end
end, { desc = "Code Runner" })
