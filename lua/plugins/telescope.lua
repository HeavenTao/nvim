return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      preview = false,
      layout_config = {
        width = 0.5,
      },
    },
  },
}
