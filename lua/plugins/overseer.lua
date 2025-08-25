return {
  "stevearc/overseer.nvim",
  opts = {},
  config = function()
    require("overseer").setup {
      templates = {
        "builtin",
        "user.zig_build",
        "user.zig_run",
      },
    }
  end,
  cmd = { "OverseerRun", "OverseerToggle" },
}
