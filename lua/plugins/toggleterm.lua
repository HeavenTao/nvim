return {
	"akinsho/toggleterm.nvim",
	lazy = true,
	config = function()
		require("toggleterm").setup({
			size = 10,
			--open_mapping = [[<c-\>]],
			insert_mappings = true,
			terminal_mappings = true,
			hide_numbers = false,
			shade_filetypes = {},
			shade_terminals = false,
			shading_factor = 2,
			start_in_insert = true,
			persist_size = true,
			persist_mode = true,
			direction = "float",
			close_on_exit = true,
			auto_scroll = true,
			shell = "fish",
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})
	end,
	keys = {
		{ "<c-\\>", mode = "n", "<Cmd>ToggleTerm<CR>", desc = "TerminalOpen" },
		{ "<c-\\>", mode = "t", "<Cmd>ToggleTerm<CR>", desc = "TerminalClose" },
		{ "<c-q>", mode = "t", [[<c-\><c-n>]], desc = "TerminalExit" },
	},
}
