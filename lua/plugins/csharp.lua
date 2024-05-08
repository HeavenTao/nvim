return {
	"iabdelkareem/csharp.nvim",
	dependencies = {
		"williamboman/mason.nvim", -- Required, automatically installs omnisharp
		"mfussenegger/nvim-dap",
		"Tastyep/structlog.nvim",
	},
	config = function()
		require("mason").setup()
		require("csharp").setup({
			lsp = {
				cmd_path = "/usr/sbin/omnisharp",
			},
		})
	end,
}
