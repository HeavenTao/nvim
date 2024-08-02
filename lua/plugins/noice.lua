return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      cmdline = {
        view = "cmdline",
      },
      messages = {
        view = "mini",
        view_error = "mini",
        view_warn = "mini",
        view_history = "messages",
      },
      notify = {
        enable = true,
        view = "mini",
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
    keys = function()
      return {
        {
          "<leader>fn",
          function()
            require("noice").cmd("all")
          end,
          desc = "Noice All",
        },
      }
    end,
  },
}
