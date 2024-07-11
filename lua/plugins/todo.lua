return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "BufEnter",
	config = function()
		require("todo-comments").setup()
	end,
}
