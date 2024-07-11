return {
	"nvim-telescope/telescope-dap.nvim",
	enabled = false,
	lazy = true,
	config = function()
		require("telescope").load_extension("dap")
	end,
	keys = {
		{
			"<leader>db",
			function()
				require("telescope").extensions.dap.list_breakpoints()
			end,
			desc = "dap list breakpoints",
		},
		{
			"<leader>dv",
			function()
				require("telescope").extensions.dap.variables()
			end,
			desc = "dap variables",
		},
	},
}
