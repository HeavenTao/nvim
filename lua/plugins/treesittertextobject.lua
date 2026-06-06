return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = false,
  branch = "main",
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    vim.g.no_plugin_maps = true

    -- Or, disable per filetype (add as you like)
    -- vim.g.no_python_maps = true
    -- vim.g.no_ruby_maps = true
    -- vim.g.no_rust_maps = true
    -- vim.g.no_go_maps = true
  end,
  config = function()
    require("nvim-treesitter-textobjects").setup {
      select = {
        lookahead = true,
        include_surrounding_whitespace = false,
      },
      move = {
        set_jumps = true,
      },
    }
  end,
  keys = {
    {
      "af",
      mode = { "x", "o" },
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
      end,
    },
    {
      "if",
      mode = { "x", "o" },
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
      end,
    },
    {
      "ab",
      mode = { "x", "o" },
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@block.outer", "textobjects")
      end,
    },
    {
      "ib",
      mode = { "x", "o" },
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@block.inner", "textobjects")
      end,
    },
    {
      "ac",
      mode = { "x", "o" },
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@call.outer", "textobjects")
      end,
    },
    {
      "ic",
      mode = { "x", "o" },
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@call.inner", "textobjects")
      end,
    },
    {
      "ah",
      mode = { "x", "o" },
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@assignment.lhs", "textobjects")
      end,
    },
    {
      "al",
      mode = { "x", "o" },
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@assignment.rhs", "textobjects")
      end,
    },
    {
      "ac",
      mode = { "x", "o" },
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
      end,
    },
    {
      "ic",
      mode = { "x", "o" },
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
      end,
    },
    {
      "cc",
      mode = { "x", "o" },
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects")
      end,
    },
    {
      "]]",
      mode = { "n", "x", "o" },
      function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
      end,
    },
    {
      "[[",
      mode = { "n", "x", "o" },
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
      end,
    },
  },
}
