return {
  "neovim/nvim-lspconfig",
  enabled = true,
  dependencies = { "saghen/blink.cmp" },
  config = function()
    require "configs.lspconfig"
  end,
}
