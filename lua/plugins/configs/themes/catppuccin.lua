-- Setting up catppucin config
return function()
	require("catppuccin").setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		background = {
			-- :h background
			light = "latte",
			dark = "mocha",
		},
		transparent_background = true,
		show_end_of_buffer = true, -- show the '~' characters after the end of buffers
		term_colors = true,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.55,
		},
		no_italic = false, -- Force no italic
		no_bold = false, -- Force no bold
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = { "italic", "bold" },
			functions = { "bold" },
			keywords = { "bold" },
			strings = {},
			variables = {},
			numbers = { "bold" },
			booleans = { "bold" },
			properties = {},
			types = { "italic" },
			operators = {},
		},
		color_overrides = {},
		custom_highlights = {},
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			telescope = true,
			notify = false,
			mini = false,
			-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		},
	})
end
