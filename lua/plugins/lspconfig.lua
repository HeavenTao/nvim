return {
  "neovim/nvim-lspconfig",
  enabled = false,
  dependencies = { "saghen/blink.cmp" },
  config = function()
    require "configs.lspconfig"
  end,
}
