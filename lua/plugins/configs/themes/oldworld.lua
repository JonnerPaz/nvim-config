return function()
	local default_config = {
		terminal_colors = true, -- enable terminal colors
		styles = { -- You can pass the style using the format: style = true
			comments = {}, -- style for comments
			keywords = {}, -- style for keywords
			identifiers = {}, -- style for identifiers
			functions = {}, -- style for functions
			variables = {}, -- style for variables
			booleans = {}, -- style for booleans
		},
		highlight_overrides = {},
	}
	return require("oldworld").setup({
		styles = {
			booleans = { bold = true },
			functions = { bold = true },
		},
		highlight_overrides = {
			bg = "#000000",
		},
	})
end
