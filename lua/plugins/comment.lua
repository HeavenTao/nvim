return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	config = function()
		require("Comment").setup({
			---Add a space b/w comment and the c

			padding = true,
			---Whether the cursor should stay at its position
			sticky = true,
			---Lines to be ignored while (un)comment
			ignore = nil,
			---LHS of toggle mappings in NORMAL mode
			toggler = {
				line = "<leader>cc",
				block = "<leader>bc",
			},
			opleader = {
				line = "<leader>cc",

				block = "<leader>bc",
			},
			extra = {
				above = nil,
				below = nil,
				eol = nil,
			},
			mappings = {
				---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`

				basic = true,
				---Extra mapping; `gco`, `gcO`, `gcA`
				extra = true,
			},

			---Function to call before (un)comment
			pre_hook = nil,
			---Function to call after (un)comment
			post_hook = nil,
		})
	end,
}
