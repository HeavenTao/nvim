return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
  opts = function()
    local myConfig = require "configs.telescope"
    local config = require "nvchad.configs.telescope"
    local result = vim.tbl_deep_extend("force", myConfig, config)
    return result
  end,
  config = function(_, opt)
    local telescope = require "telescope"
    telescope.setup(opt)
    telescope.load_extension "ui-select"
  end,
}
