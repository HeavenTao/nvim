-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gruvchad",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  Find File", "leader f f", "Telescope find_files" },
      { "󰈚  Recent Files", "leader f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "leader f w", "Telescope live_grep" },
      { "  Bookmarks", "leader m a", "Telescope marks" },
      { "  Themes", "leader t h", "Telescope themes" },
      { "  Mappings", "leader c h", "NvCheatsheet" },
    },
  },
  telescope = { style = "borderless" }, -- borderless / bordered
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs" },
    modules = nil,
  },
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
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
          return "TS 󰈈 "
        else
          return "TS 󰈉 "
        end
      end,
    },
  },
}

return M
