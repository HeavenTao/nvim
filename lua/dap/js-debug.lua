return {
	"microsoft/vscode-js-debug",
	dependencies = { "mxsdev/nvim-dap-vscode-js" },
	build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	config = function()
		require("dap-vscode-js").setup({
			debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
			adapters = {
				"node",
				"chrome",
				"pwa-node",
				"pwa-chrome",
				"pwa-msedge",
				"node-terminal",
				"pwa-extensionHost",
			},
		})

		local js_based_language = { "typescript", "javascript" }

		for _, language in ipairs(js_based_language) do
			require("dap").configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}
		end
	end,
}
