local _M = {
	setup = function()
		local install_root_dir = vim.fn.stdpath("data") .. "/mason"
		local extension_path = install_root_dir .. "/packages/codelldb/extension/"
		local codelldb_path = extension_path .. "adapter/codelldb"
		local dap = require("dap")
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = codelldb_path,
				args = { "--port", "${port}" },
			},
		}

		local languages = { "c", "cpp", "rust" }

		for _, lang in ipairs(languages) do
			dap.configurations[lang] = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
				},
			}
		end
	end,
}

return _M
