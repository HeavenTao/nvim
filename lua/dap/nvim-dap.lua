return {
	"mfussenegger/nvim-dap",
	config = function()
		vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939" })
		vim.api.nvim_set_hl(0, "DapStoppedLinehl", { bg = "#555530" })

		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" }
		)
		vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapStopped",
			{ text = "", texthl = "DapBreakpoint", linehl = "DapStoppedLinehl", numhl = "" }
		)
	end,
	keys = {
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Start Debug",
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "Step over",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "Step into",
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "Step out",
		},
		{
			"<leader>b",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "toggle breakpoint",
		},
	},
}
