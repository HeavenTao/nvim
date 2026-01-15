return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require "dap"
    local ui = require "dapui"
    ui.setup()

    vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.env.CODE_LLDB_PATH,
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.zig = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }

    dap.configurations.c = {
      name = "Launch",
      type = "codelldb",
      requrest = "launch",
      program = function()
        return vim.fn.input("Path to executeable:", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
    }
  end,
  keys = {
    {
      "<F5>",
      function()
        local dap = require "dap"
        dap.continue()
      end,
      mode = { "n" },
    },
    {
      "<F9>",
      function()
        local dap = require "dap"
        dap.toggle_breakpoint()
      end,
    },
    {
      "<Down>",
      function()
        local dap = require "dap"
        dap.step_over()
      end,
    },
    {
      "<Right>",
      function()
        local dap = require "dap"
        dap.step_into()
      end,
    },
    {
      "<Left>",
      function()
        local dap = require "dap"
        dap.step_out()
      end,
    },
  },
}
