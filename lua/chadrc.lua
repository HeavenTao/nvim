-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gruvchad",
}

M.nvdash = {
  load_on_startup = true,
  buttons = {
    { txt = "  Find File", keys = "leader f f", cmd = "Telescope find_files" },
    { txt = "󰈭  Find Word", keys = "leader f w", cmd = "Telescope live_grep" },
    { txt = "  Themes", keys = "leader t h", cmd = "Telescope themes" },
    { txt = "  Mappings", keys = "leader c h", cmd = "NvCheatsheet" },
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
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "treesitter", "cwd", "cursor" },
    separator_style = "default",
    modules = {
      treesitter = function()
        if not package.loaded["nvim-treesitter"] then
          return ""
        end
        local parsers = require "nvim-treesitter.parsers"
        local has_parser = parsers.has_parser(parsers.get_buf_lang(vim.api.nvim_get_current_buf()))
        if has_parser then
          return "%#Special# 󰈈  "
        else
          return "%#Special# 󰈉  "
        end
      end,
    },
  },
}

return M
