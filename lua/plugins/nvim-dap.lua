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

    --------------------------------------------------------------------
    -- 路径解析工具
    -- 注意：os.getenv 在变量未设置时返回 nil，nil .. string 会直接报错，
    -- 所以所有路径都要先做存在性检查再使用。
    --------------------------------------------------------------------
    local function is_file(path)
      if type(path) ~= "string" or path == "" then
        return false
      end
      local stat = vim.uv.fs_stat(path)
      return stat ~= nil and stat.type == "file"
    end

    local function first_file(candidates)
      for _, candidate in ipairs(candidates) do
        if is_file(candidate) then
          return candidate
        end
      end
    end

    -- root 既可以是目录，也可以直接指向最终文件
    local function expand(root, suffixes)
      local paths = {}
      if type(root) == "string" and root ~= "" then
        paths[#paths + 1] = root
        for _, suffix in ipairs(suffixes) do
          paths[#paths + 1] = root .. suffix
        end
      end
      return paths
    end

    local function warn(message)
      vim.schedule(function()
        vim.notify("nvim-dap: " .. message, vim.log.levels.WARN)
      end)
    end

    -------------------------------------------------- pwa-node / js-debug
    local js_debug_suffixes = {
      "/lib/node_modules/js-debug/dist/src/dapDebugServer.js",
      "/dist/src/dapDebugServer.js",
    }

    local js_debug_candidates = expand(vim.env.VSCODE_JS_DEBUG, js_debug_suffixes)

    -- 兜底：从 PATH 里的 js-debug 包装脚本反推 nix store 前缀
    local js_debug_bin = vim.fn.exepath "js-debug"
    if js_debug_bin ~= "" then
      local real = vim.uv.fs_realpath(js_debug_bin) or js_debug_bin
      vim.list_extend(js_debug_candidates, expand(vim.fn.fnamemodify(real, ":h:h"), js_debug_suffixes))
    end

    local js_debug_server = first_file(js_debug_candidates)

    if js_debug_server then
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { js_debug_server, "${port}" },
        },
      }
      dap.configurations.javascript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }
    else
      warn "找不到 js-debug (dapDebugServer.js)，请设置环境变量 VSCODE_JS_DEBUG"
    end

    ----------------------------------------------------- codelldb / C / Zig
    local codelldb_suffixes = {
      "/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb",
    }

    local codelldb_candidates = expand(vim.env.CODE_LLDB_PATH, codelldb_suffixes)

    -- 兜底：在 nix store 里找已安装的 codelldb
    if not first_file(codelldb_candidates) then
      for _, prefix in ipairs(vim.fn.glob("/nix/store/*vscode-extension-vadimcn-vscode-lldb-*", false, true)) do
        vim.list_extend(codelldb_candidates, expand(prefix, codelldb_suffixes))
      end
    end

    local codelldb_bin = first_file(codelldb_candidates)

    if codelldb_bin then
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb_bin,
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
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }
    else
      warn "找不到 codelldb，请设置环境变量 CODE_LLDB_PATH"
    end
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
