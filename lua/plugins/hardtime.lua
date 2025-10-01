return {
  "m4xshen/hardtime.nvim",
  lazy = false,
  enabled = false,
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    max_count = 10,
    disabled_filetypes = {
      lazy = true,
      ["Outline"] = true,
      markdown = true,
    },
  },
  config = function(_, opt)
    require("hardtime").setup(opt)
  end,
}
