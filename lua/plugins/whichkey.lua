return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		plugins = { spelling = true },
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup({
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "", -- symbol used between a key and it's label
				group = "+",
			},
		})
		wk.register(opts.defaults)
	end,
}
