return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>n",
			"<cmd>Neotree source=filesystem position=right toggle=true reveal=true<cr>",
			"Neotree filesystem",
		},
		{
			"<leader>b",
			"<cmd>Neotree source=buffers position=right toggle=true reveal=true<cr>",
			"Neotree buffers",
		},
	},
	config = function()
		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

		require("neo-tree").setup({
			close_if_last_window = true,
			filesystem = {
				filtered_items = {
					hide_dotfiles = true,
				},
				use_libuv_file_watcher = true,
				window = {
					mappings = {
						["l"] = {
							"toggle_node",
						},
						["h"] = {
							"close_node",
						},
						["<ESC>"] = "clear_filter",
					},
					fuzzy_finder_mappings = {
						["<C-j>"] = "move_cursor_down",
						["<C-k>"] = "move_cursor_up",
					},
				},
			},
		})
	end,
}
