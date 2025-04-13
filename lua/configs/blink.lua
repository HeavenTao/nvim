local opts = {
  cmdline = {
    completion = {
      menu = {
        auto_show = true,
      },
    },
    keymap = {
      ["<Tab>"] = { "accept" },
    },
  },
  completion = {
    documentation = {
      treesitter_highlighting = false,
    },
  },
  signature = {
    window = {
      treesitter_highlighting = false,
    },
  },
}

return opts
