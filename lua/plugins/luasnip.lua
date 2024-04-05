return {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp",
	lazy = false,
	dependencies = {
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip").filetype_extend("lua", { "luadoc" })
			require("luasnip").filetype_extend("javascript", { "jsdoc" })
			require("luasnip").filetype_extend("python", { "pydoc" })
		end,
	},
	opt = {
		history = true,
		delete_check_events = "TextChanged",
	},
	config = function()
		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node
		local rep = require("luasnip.extras").rep

		ls.add_snippets("lua", {
			s("wid", {
				t("local "),
				i(1),
				t({
					" = { mt = {} }",
					"",
					"local function new(...) end",
					"",
				}),
				t("function "),
				rep(1),
				t({
					".mt__call(...)",
				}),
				t({ "", "\t" }),
				t({
					"return new (...)",
					"end",
					"",
				}),
				t("return setmetatable("),
				rep(1),
				t(", "),
				rep(1),
				t(".mt)"),
			}),
		})
	end,
	keys = {
		{
			"<tab>",
			function()
				return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
			end,
			expr = true,
			silent = true,
			mode = "i",
		},
		{
			"<tab>",
			function()
				require("luasnip").jump(1)
			end,
			mode = "s",
		},
		{
			"<s-tab>",
			function()
				require("luasnip").jump(-1)
			end,
			mode = { "i", "s" },
		},
	},
}
