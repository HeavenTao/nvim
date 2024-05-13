return {
	"mfussenegger/nvim-dap",
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
