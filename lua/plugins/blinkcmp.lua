return {
  "saghen/blink.cmp",
  -- optional: provides snippets for the snippet source
  dependencies = {
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
  },
  enabled = true,
  config = function(_, opts)
    local cmp_hl = require("base46").get_integration "cmp"
    for key, value in pairs(cmp_hl) do
      vim.api.nvim_set_hl(0, key, value)
    end
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "NonText" })
    require("blink.cmp").setup(opts)
  end,
  event = "InsertEnter",
  -- use a release tag to download pre-built binaries
  version = "1.*",
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    cmdline = {
      enabled = true,
      completion = {
        menu = {
          auto_show = true,
        },
      },
      keymap = {
        ["<Tab>"] = { "accept" },
      },
    },
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = "default",
      ["<CR>"] = { "accept", "fallback" },
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
      use_nvim_cmp_as_default = true,
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      documentation = {
        treesitter_highlighting = false,
        auto_show = true,
        window = {
          border = "rounded",
        },
      },
      ghost_text = { enabled = true },
      menu = {
        border = "rounded",
        draw = {
          -- treesitter = { "lsp" },
          columns = {
            { "label" },
            { "kind_icon", "kind", gap = 1 },
            { "source_name", gap = 1 },
          },
          components = {
            kind_icon = {
              text = function(ctx)
                local lspkind = require "lspkind"
                local icon = ctx.kind_icon
                if not vim.tbl_contains({ "Path" }, ctx.source_name) then
                  icon = lspkind.symbolic(ctx.kind, {
                    mode = "symbol",
                  })
                end
                return icon .. ctx.icon_gap
              end,
            },
          },
        },
        scrollbar = true,
      },
    },

    signature = {
      enabled = true,
      window = {
        border = "rounded",
        show_documentation = true,
        treesitter_highlighting = false,
      },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    snippets = { preset = "luasnip" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        buffer = {
          opts = {
            get_bufnrs = function()
              return vim.tbl_filter(function(bufnr)
                return vim.bo[bufnr].buftype == ""
              end, vim.api.nvim_list_bufs())
            end,
          },
        },
      },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "rust" },
  },
  opts_extend = { "sources.default" },
}
