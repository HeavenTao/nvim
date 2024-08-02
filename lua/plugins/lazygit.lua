return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>g",
        function()
          LazyVim.lazygit({ cwd = LazyVim.root.git() })
        end,
        desc = "Git",
      },
    },
  },
}
