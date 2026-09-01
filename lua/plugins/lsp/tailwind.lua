return {
	"luckasRanarison/tailwind-tools.nvim",
	name = "tailwind-tools",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
	},
	ft = {
		"html",
		"css",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"astro",
	},
	opts = {
		document_color = {
			enabled = true,
			kind = "inline",
			inline_symbol = "󰝤 ",
			debounce = 200,
		},
		conceal = {
			enabled = false,
			symbol = "󱏿",
			highlight = {
				fg = "#38BDF8",
			},
		},
		cmp = {
			highlight = "foreground",
		},
	},
}
