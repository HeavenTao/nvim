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
          preselect = function()
            local type = vim.fn.getcmdtype()
            if type == ":" then
              return true
            end
            return false
          end,
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
      treesitter_highlighting = true,
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
      treesitter_highlighting = true,
    },
  },
}

return opts
