return {
  {
    "luozhiya/fittencode.nvim",
    enabled = false,
    config = function()
      require("fittencode").setup({
        completion_mode = "source",
      })
    end,
  },
}
