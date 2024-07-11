return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	enabled = false,
	config = function()
		require("dapui").setup()

		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		require("neodev").setup({
			library = {
				plugins = { "nvim-dap-ui", types = true },
			},
		})
	end,
	--keys = {
	--{
	--"<leader>ui",
	--function()
	--require("dapui").toggle()
	--end,
	--desc = "dapui",
	--},
	--},
}
