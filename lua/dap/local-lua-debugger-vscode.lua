return {
	"tomblind/local-lua-debugger-vscode",
	build = "npm install && npm run build",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		local dap = require("dap")
		dap.adapters["local-lua"] = {
			type = "executable",
			command = "node",
			args = {
				vim.fn.stdpath("data") .. "/lazy/local-lua-debugger-vscode/extension/debugAdapter.js",
			},
			enrich_config = function(config, on_config)
				if not config["extensionPath"] then
					local c = vim.deepcopy(config)
					c.extensionPath = vim.fn.stdpath("data") .. "/lazy/local-lua-debugger-vscode/"
					on_config(c)
				else
					on_config(config)
				end
			end,
		}

		dap.configurations.lua = {
			{
				name = "Current file (local-lua-dbg,lua)",
				type = "local-lua",
				request = "launch",
				cwd = "${workspaceFolder}",
				program = {
					lua = "lua5.4",
					file = "${file}",
				},
				args = {},
			},
		}
	end,
}
