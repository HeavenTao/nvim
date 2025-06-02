local opts = {
  keymap = {
    preset = "enter",
    ["<Tab>"] = { "snippet_forward", "fallback" },
    ["<CR>"] = { "select_and_accept", "fallback" },
  },
  cmdline = {
    completion = {
      menu = {
        auto_show = true,
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
    },
    keymap = {
      ["<Tab>"] = { "accept" },
      ["<CR>"] = { "accept_and_enter", "fallback" },
    },
  },
  completion = {
    documentation = {
      treesitter_highlighting = false,
    },
    list = {
      selection = {
        preselect = true,
        auto_insert = false,
      },
    },
  },
  signature = {
    window = {
      treesitter_highlighting = false,
    },
  },
}

return opts
