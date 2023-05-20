function ColorMyPencils(color)
	color = color or "github_dark_dimmed"
	-- color = color or "catppuccin"

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- Default options
	require("github-theme").setup({
		options = {
			-- Compiled file's destination location
			compile_path = vim.fn.stdpath("cache") .. "/github-theme",
			compile_file_suffix = "_compiled", -- Compiled file suffix
			hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
			hide_nc_statusline = true, -- Override the underline style for non-active statuslines
			transparent = false, -- Disable setting background
			terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
			dim_inactive = true, -- Non focused panes set to alternative background
			module_default = true, -- Default enable value for modules
			styles = { -- Style to be applied to different syntax groups
				comments = "italic", -- Value is any valid attr-list value `:help attr-list`
				functions = "bold",
				keywords = "italic",
				variables = "NONE",
				conditionals = "italic",
				constants = "NONE",
				numbers = "NONE",
				operators = "NONE",
				strings = "NONE",
				types = "NONE",
			},
			inverse = { -- Inverse highlight for different types
				match_paren = false,
				visual = false,
				search = false,
			},
			darken = { -- Darken floating windows and sidebar-like windows
				floats = true,
				sidebars = {
					enable = true,
					list = {}, -- Apply dark background to specific windows
				},
			},
			modules = { -- List of various plugins and additional options
				-- ...
			},
		},
		palettes = {},
		specs = {},
		groups = {},
	})

	-- Setting up catppucin config
	--[[ 	require("catppuccin").setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		background = { -- :h background
			light = "latte",
			dark = "mocha",
		},
		transparent_background = false,
		show_end_of_buffer = true, -- show the '~' characters after the end of buffers
		term_colors = false,
		dim_inactive = {
			enabled = true,
			shade = "dark",
			percentage = 0.55,
		},
		no_italic = false, -- Force no italic
		no_bold = false, -- Force no bold
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = {},
			functions = { "bold" },
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
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
	}) ]]

	-- setup must be called before loading
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
