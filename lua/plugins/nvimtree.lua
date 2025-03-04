return {
  "nvim-tree/nvim-tree.lua",
  opts = function()
    local width = math.ceil(vim.o.columns * 0.8)
    local height = math.ceil(vim.o.lines * 0.8)
    local x = math.ceil(vim.o.columns / 2 - width / 2)
    local y = math.ceil(vim.o.lines / 2 - height / 2 - 2)

    local opts = require "nvchad.configs.nvimtree"
    opts = vim.tbl_deep_extend("force", opts, {
      view = {
        float = {
          enable = true,
          quit_on_focus_loss = true,
          open_win_config = {
            width = width,
            height = height,
            col = x,
            row = y,
          },
        },
      },
    })
    return opts
  end,
}
