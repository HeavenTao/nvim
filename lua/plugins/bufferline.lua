return {
	"akinsho/bufferline.nvim",
	--version = "*",
	branch = "main",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.bufremove",
	},
	event = "BufEnter",
	keys = {
		{ "<A-,>", "<cmd>BufferLineCyclePrev<cr>", "BufferLineCyclePrev" },
		{ "<A-.>", "<cmd>BufferLineCycleNext<cr>", "BufferLineCycleNext" },
		{
			"<A-c>",
			function()
				local bd = require("mini.bufremove").delete
				if vim.bo.modified then
					local choice =
						vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
					if choice == 1 then
						vim.cmd.write()
						bd(0)
					elseif choice == 2 then
						bd(0, true)
					end
				else
					bd(0)
				end
			end,
			"BufferDelete",
		},
		{ "<A-[>", "<cmd>BufferLineMovePrev<cr>", "BufferLineMovePrev" },
		{ "<A-]>", "<cmd>BufferLineMoveNext<cr>", "BufferLineMoveNext" },
		{ "<A-p>", "<cmd>BufferLineTogglePin<cr>", "BufferLineTogglePin" },
		{ "<A-s>", "<cmd>BufferLineSortByDirectory<cr>", "BufferLineSortByDirectory" },
		{ "<A-f>", "<cmd>BufferLinePick<cr>", "BufferLinePick" },
	},
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				separator_style = "slant",
				themable = true,
				close_command = "bdelete %d",
				mode = "buffers",
				diagnostics = "nvim_lsp",
				hover = {
					enable = false,
					delay = 200,
					reveal = { "close" },
				},
				indicator = {
					style = "underline",
				},
			},
		})
	end,
}
