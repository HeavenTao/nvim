return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      --t,T,f,F
      char = {
        enabled = false, --会影响dt等操作
      },
    },
    label = {
      rainbow = {
        enabled = true,
      },
    },
  },
  keys = {
    {
      "/",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump { search = { forward = true, wrap = true, multi_window = false } }
      end,
    },
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        -- default options: exact mode, multi window, all directions, with a backdrop
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "o", "x" },

      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
  },
}
