return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function()
    local myConfig = require "configs.telescope"
    local config = require "nvchad.configs.telescope"
    local result = vim.tbl_deep_extend("force", myConfig, config)
    return result
  end,
}
