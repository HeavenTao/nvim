return {
	"lewis6991/hover.nvim",
	config = function()
		require("hover").setup({
			init = function()
				require("hover.providers.lsp")
			end,
			preview_opts = {
				border = "single",
			},
			preview_window = false,
			title = true,
			mouse_providers = {
				"LSP",
			},
			mouse_delay = 1000,
		})
	end,
	keys = {
		{
			"K",
			mode = { "n" },
			function()
				require("hover").hover()
			end,
			desc = "hover.nvim",
		},
		{
			"gK",
			mode = { "n" },
			function()
				require("hover").hover_select()
			end,
			desc = "hover.nvim(select)",
		},
		{
			"<c-p>",
			mode = { "n" },
			function()
				require("hover").hover_switch("previous")
			end,
			desc = "hover.nvim(previous source)",
		},
		{
			"<c-n>",
			mode = { "n" },
			function()
				require("hover").hover_switch("next")
			end,
			desc = "hover.nvim(next source)",
		},
	},
}
