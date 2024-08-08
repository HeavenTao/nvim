return {
  "lukas-reineke/indent-blankline.nvim",
  event="VeryLazy",
  main="ibl",
  config=function ()
    require("ibl").setup({
      indent={
        char = "│",
        tab_char = "│",
      },
      exclude={
        filetypes={
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
          "startify"
        }
      }
    })
  end
}
