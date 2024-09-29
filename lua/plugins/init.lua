return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "folke/which-key.nvim",
    enabled = false,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  -- treesj
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = { "<space>m" },
    config = function()
      require("treesj").setup {
        max_join_length = 1200,
      }
    end,
  },
  -- flash
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        --t,T,f,F
        char = {
          enabled = false, --会影响dt}等操作
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },

        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },

        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>g", "<Cmd>LazyGit<CR>", desc = "Git" },
    },
  },
  -- Marks
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
      require("marks").setup()
    end,
  },
  --Surround
  {
    "kylechui/nvim-surround",
    event = "InsertEnter",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  --Autotag
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  --dap.nvim
  {
    "mfussenegger/nvim-dap",
    config = function()
      local mason_registry = require "mason-registry"

      local codelldb = mason_registry.get_package "codelldb"
      vim.print(codelldb:get_install_path())

      local dap = require "dap"
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb:get_install_path() .. "/extension/adapter/codelldb",
          args = { "--port", "${port}" },
        },
      }
    end,
    keys = {
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        "<leader>b",
        desc = "Debugger",
      },
      {
        "<leader>b",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "set breakpoint",
      },
    },
  },
}
