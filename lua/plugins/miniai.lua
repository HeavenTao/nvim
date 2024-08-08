return {
	"echasnovski/mini.nvim",
	version = "*",
	event = "VeryLazy",
	enabled = true,
	config = function()
		require("mini.ai").setup()
	end,
}
