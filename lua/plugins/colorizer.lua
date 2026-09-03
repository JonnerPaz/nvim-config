return {
	"catgoose/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		filetypes = {
			"html",
			"css",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"astro",
		},
		options = {
			parsers = {
				hex = { default = true },
				tailwind = {
					enable = true,
					lsp = {
						enable = true,
						disable_document_color = true,
					},
					update_names = true,
				},
			},
			display = {
				mode = "virtualtext",
				virtualtext = {
					char = "󰝤 ",
					position = "inline",
					hl_mode = "foreground",
				},
				disable_document_color = true,
			},
		},
	},
}
