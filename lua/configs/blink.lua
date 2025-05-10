local opts = {
  keymap = {
    preset = "super-tab",
  },
  cmdline = {
    completion = {
      menu = {
        auto_show = true,
      },
    },
    keymap = {
      ["<Tab>"] = { "accept" },
      ["<Enter>"] = { "accept_and_enter", "fallback" },
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
