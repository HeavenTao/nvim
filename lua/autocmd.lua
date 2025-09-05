local function augroup(name)
  return vim.api.nvim_create_augroup("nv_chard_custorm" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup "close_with_q",
  pattern = {
    "qf",
    "help",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true, desc = "Quit buffer" })
  end,
})

--zig
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.zig", "*.zon" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- vim.cmd "autocmd BufNewFile,BufRead * set fileformat=unix"

-- clipboard on wsl
-- if vim.fn.has "wsl" == 1 then
--   vim.api.nvim_create_autocmd("TextYankPost", {
--     group = vim.api.nvim_create_augroup("Yank", { clear = true }),
--     callback = function()
--       vim.fn.system("clip.exe", vim.fn.getreg '"')
--     end,
--   })
-- end

--user command
vim.api.nvim_create_user_command("Build", function(args)
  vim.cmd "write"
  if vim.bo.ft == "zig" then
    require("nvchad.term").runner {
      id = "htoggleTerm",
      pos = "float",
      float_opts = {
        row = 0.05,
        col = 0.1,
        width = 0.8,
        height = 0.8,
        border = "rounded",
      },
      cmd = function()
        return "clear;zig build;echo 'Run Build.' "
      end,
    }
  end
end, { desc = "build current project" })

vim.api.nvim_create_user_command("Run", function(args)
  vim.cmd "write"
  if vim.bo.ft == "zig" then
    require("nvchad.term").runner {
      id = "htoggleTerm",
      pos = "float",
      float_opts = {
        row = 0.05,
        col = 0.1,
        width = 0.8,
        height = 0.8,
        border = "rounded",
      },
      cmd = function()
        return "clear;zig build run"
      end,
    }
  end
end, { desc = "run current file" })

vim.api.nvim_create_user_command("Test", function(args)
  vim.cmd "write"
  if vim.bo.ft == "zig" then
    require("nvchad.term").runner {
      id = "htoggleTerm",
      pos = "float",
      float_opts = {
        row = 0.05,
        col = 0.1,
        width = 0.8,
        height = 0.8,
        border = "rounded",
      },
      cmd = function()
        local file = vim.fn.expand "%"
        local cmd = "zig test " .. file
        local utils = require "utils"
        local test_name = utils.get_current_test_name()
        if test_name ~= nil then
          cmd = cmd .. " --test-filter " .. test_name .. ";echo 'Run Unit Test:'" .. test_name
        else
          cmd = cmd .. ";echo 'Run All Unit Test'"
        end
        return "clear;" .. cmd
      end,
    }
  end
end, { desc = "test current file" })
