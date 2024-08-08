return {
	"gbprod/yanky.nvim",
	opts = {
		highlight = {
			timer = 150,
		},
	},
	config = function(_, opts)
		require("yanky").setup(opts)
		require("telescope").load_extension("yank_history")
	end,
	keys = {
		{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
		{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put Text After Cursor" },
	},
}
