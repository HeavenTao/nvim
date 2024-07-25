return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = {
					"branch",
					{
						"diff",
						diff_color = {
							added = { fg = "#9ece6a" },
							modified = { fg = "#7aa2f7" },
							removed = { fg = "#f7768e" },
						},
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
					},
					"diagnostics",
				},
				lualine_c = {
					{
						"filename",
						icon = "",
						path = 3,
					},
				},
				lualine_x = {
					{
						function()
							local clients = vim.lsp.get_active_clients({ bufnr = 0 })
							if next(clients) == nil then
								return "No LSP"
							end

							local client_names = {}
							for _, client in ipairs(clients) do
								table.insert(client_names, client.name)
							end

							return "[" .. table.concat(client_names, ",") .. "]"
						end,
						icon = " ",
						color = {
							fg = "#1abc9c",
						},
					},
					{
						function()
							if not package.loaded["nvim-treesitter"] then
								return ""
							end
							local parsers = require("nvim-treesitter.parsers")
							local has_parser = parsers.has_parser(parsers.get_buf_lang(vim.api.nvim_get_current_buf()))
							if has_parser then
								return "TS 󰈈 "
							else
								return "TS 󰈉 "
							end
						end,
						color = {
							fg = "#1abc9c",
						},
					},
					{
						"filetype",
						color = {
							fg = "#1abc9c",
						},
					},
					{
						"encoding",
						color = {
							fg = "#1abc9c",
						},
					},
				},
				lualine_y = {
					{
						"progress",
						icon = "󰠞",
						color = {
							bg = "#FF7777",
							fg = "#1e1e2e",
						},
					},
					{
						"location",
						icon = "",
						color = {
							bg = "#41C9E2",
							fg = "#1e1e2e",
						},
					},
				},
				lualine_z = {
					{
						function()
							return os.date("%R")
						end,
						color = {
							bg = "#1abc9c",
						},
						icon = " ",
					},
				},
			},
			extensions = { "lazy", "mason", "neo-tree", "symbols-outline", "toggleterm", "trouble" },
		})
	end,
}
