return {
  {
    "akinsho/bufferline.nvim",
    branch = "main",
    opts = {
      options = {
        separator_style = "slant",
        themable = true,
        close_command = "bdelete %d",
        mode = "buffers",
        diagnostics = "nvim_lsp",
        hover = {
          enable = false,
          delay = 200,
          reveal = { "close" },
        },
        indicator = {
          style = "underline",
        },
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",

            highlight = "Directory",
            text_align = "right",
          },
        },
      },
    },
    keys = function()
      return {
        { "<A-,>", "<cmd>BufferLineCyclePrev<cr>", "BufferLineCyclePrev" },
        { "<A-.>", "<cmd>BufferLineCycleNext<cr>", "BufferLineCycleNext" },
        { "<A-[>", "<cmd>BufferLineMovePrev<cr>", "BufferLineMovePrev" },
        { "<A-]>", "<cmd>BufferLineMoveNext<cr>", "BufferLineMoveNext" },
        { "<A-p>", "<cmd>BufferLineTogglePin<cr>", "BufferLineTogglePin" },
        { "<A-s>", "<cmd>BufferLineSortByDirectory<cr>", "BufferLineSortByDirectory" },
        { "<A-f>", "<cmd>BufferLinePick<cr>", "BufferLinePick" },
        { "<A-c>", LazyVim.ui.bufremove, "BufferLinePick" },
      }
    end,
  },
}
