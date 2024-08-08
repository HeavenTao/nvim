return {
	"nvim-telescope/telescope.nvim",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	config = function()
		local custom_actions = {}
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		function custom_actions.fzf_multi_select(prompt_bufnr)
			local picker = action_state.get_current_picker(prompt_bufnr)
			local num_selections = #(picker:get_multi_selection())

			if num_selections > 1 then
				picker = action_state.get_current_picker(prompt_bufnr)
				for _, entry in ipairs(picker:get_multi_selection()) do
					vim.cmd(string.format("%s %s", ":e!", entry.value))
				end
				vim.cmd("stopinsert")
			else
				actions.file_edit(prompt_bufnr)
			end
		end
		require("telescope").setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.95,
					height = 0.95,
				},
				mappings = {
					i = {
						--["<cr>"] = custom_actions.fzf_multi_select,
						["<c-f>"] = actions.preview_scrolling_down,
						["<c-b>"] = actions.preview_scrolling_up,
					},
					n = {
						--["<cr>"] = custom_actions.fzf_multi_select,
						["<c-f>"] = actions.preview_scrolling_down,
						["<c-b>"] = actions.preview_scrolling_up,
					},
				},
			},
		})
	end,
	keys = {
		{ "<leader>f", "<Cmd>Telescope find_files<cr>", desc = "find_files" },
		{ "<leader>fg", "<Cmd>Telescope live_grep<cr>", desc = "live_grep" },
		{ "<leader>ft", "<Cmd>TodoTelescope<cr>", desc = "todo" },
		{ "<leader>fk", "<Cmd>Telescope keymaps<cr>", desc = "keymaps" },
		{ "<leader>fm", "<Cmd>Telescope marks<cr>", desc = "marks" },
		{ "<leader>fr", "<Cmd>Telescope registers<cr>", desc = "registers" },
		{ "<leader>fy", "<Cmd>Telescope yank_history<cr>", desc = "yank_history" },
		{ "<leader>ff", "<Cmd>Telescope yank_history<cr>", desc = "yank_history" },
	},
}
