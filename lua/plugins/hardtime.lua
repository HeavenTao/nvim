return {
  "m4xshen/hardtime.nvim",
  lazy = false,
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    max_count = 10,
  },
  config = function(_, opt)
    require("hardtime").setup(opt)
  end,
}
