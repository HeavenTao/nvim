return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  event="InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local paths = vim.list_extend(
      vim.api.nvim_get_runtime_file("package.json", true),
      vim.api.nvim_get_runtime_file("package.jsonc", true)
    )

    for index, value in ipairs(paths) do
      paths[index] = vim.fn.fnamemodify(value, ":p:h")
    end

    table.insert(paths, os.getenv("HOME") .. "/.config/nvim/lua/snippets/")

    require("luasnip.loaders.from_vscode").lazy_load({
      paths = paths,
    })

    require("luasnip").filetype_extend("lua", { "luadoc" })
    require("luasnip").filetype_extend("javascript", { "jsdoc" })
    require("luasnip").setup({
      history=true,
      delete_check_events="TextChanged"
    })
  end,
  keys = {
    {
      "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true,
      silent = true,
      mode = "i",
    },
    {
      "<tab>",
      function()
        require("luasnip").jump(1)
      end,
      mode = "s",
    },
    {
      "<s-tab>",
      function()
        require("luasnip").jump(-1)
      end,
      mode = { "i", "s" },
    },
    {
      "<c-e>",
      function()
        local ls = require("luasnip")
        if ls.choice_active then
          ls.change_choice(1)
        end
      end,
      mode = { "i", "s" },
    },
  },
}
