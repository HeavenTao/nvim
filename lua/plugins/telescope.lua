return {
	"nvim-telescope/telescope.nvim",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	config = function()
		require("telescope").setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.95,
					height = 0.95,
				},
			},
		})
	end,
	keys = {
		{ "<leader>f", "<Cmd>Telescope find_files<cr>", desc = "find_files" },
		{ "<leader>fg", "<Cmd>Telescope live_grep<cr>", desc = "live_grep" },
		{ "<leader>ft", "<Cmd>TodoTelescope<cr>", desc = "todo" },
		{ "<leader>fk", "<Cmd>Telescope keymaps<cr>", desc = "keymaps" },
	},
}
