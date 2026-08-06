-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyodark",
}

M.nvdash = {
  load_on_startup = true,
  buttons = {
    { txt = "  Find File", keys = "leader f f", cmd = "Telescope find_files" },
    { txt = "󰈭  Find Word", keys = "leader f w", cmd = "Telescope live_grep" },
    { txt = "  Themes", keys = "leader t h", cmd = "Telescope themes" },
    { txt = "  Mappings", keys = "leader c h", cmd = "NvCheatsheet" },
    { txt = "-", hl = "NvDashFooter", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. "ms"

        return "Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },
    { txt = "-", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

M.ui = {
  telescope = { style = "bordered" }, -- borderless / bordered
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs" },
    modules = nil,
  },
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lsp",
      "treesitter",
      "cwd",
      "line_percent",
      "cursor",
    },
    separator_style = "default",
    modules = {
      line_percent = function()
        local current_line = vim.fn.line "."
        local all_line = vim.fn.line "$"
        local percent = current_line / all_line * 100
        return "%#St_pos_sep#" .. string.format("%4d", percent) .. "%% "
      end,
      cursor = function()
        local line = vim.fn.line "."
        local col = vim.fn.virtcol "."
        -- 行号宽度 = 总行数的位数（同一 buffer 内恒定，不同文件自适应）
        local line_w = #tostring(vim.fn.line "$")
        -- 列宽至少 3 位，并跟随行宽，保证永不截断
        local col_w = math.max(3, line_w)
        return string.format("%%#StText# Ln %" .. line_w .. "d, Col %" .. col_w .. "d ", line, col)
      end,
      treesitter = function()
        local buf = vim.api.nvim_get_current_buf()
        local ft = vim.bo[buf].filetype
        if ft == "" then
          return ""
        end
        -- pcall(inspect) 只在 parser 二进制真正安装时才成功
        local ok = pcall(vim.treesitter.language.inspect, ft)
        if ok then
          return "%#Special# 󰈈  "
        else
          return "%#Special# 󰈉  "
        end
      end,
    },
  },
}

M.lsp = {
  signature = true,
}

return M
