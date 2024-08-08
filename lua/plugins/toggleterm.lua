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
			--direction = "float",
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

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<A-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<A-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<A-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<A-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
	keys = {
		{ "<c-\\>", mode = "n", "<Cmd>ToggleTerm<CR>", desc = "TerminalOpen" },
		{ "<c-\\>", mode = "t", "<Cmd>ToggleTerm<CR>", desc = "TerminalClose" },
		{ "<c-q>", mode = "t", [[<c-\><c-n>]], desc = "TerminalExit" },
	},
}
