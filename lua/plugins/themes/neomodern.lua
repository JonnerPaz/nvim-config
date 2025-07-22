return {
	"cdmill/neomodern.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("neomodern").setup({
			-- Can be one of: 'iceclimber' | 'gyokuro' | 'hojicha' | 'roseprime'
			theme = "hojicha",
			-- Can be one of: 'light' | 'dark', or set via vim.o.background
			variant = "dark",
			-- Use an alternate, darker bg
			alt_bg = false,
			-- If true, docstrings will be highlighted like strings, otherwise they will be
			-- highlighted like comments. Note, behavior is dependent on the language server.
			colored_docstrings = true,
			-- If true, highlights the {sign,fold} column the same as cursorline
			cursorline_gutter = true,
			-- If true, highlights the gutter darker than the bg
			dark_gutter = false,
			-- if true favor treesitter highlights over semantic highlights
			favor_treesitter_hl = false,
			-- Don't set background of floating windows. Recommended for when using floating
			-- windows with borders.
			plain_float = false,
			-- Show the end-of-buffer character
			show_eob = true,
			-- If true, enable the vim terminal colors
			term_colors = true,
			-- Keymap (in normal mode) to toggle between light and dark variants.
			toggle_variant_key = nil,
			-- Don't set background
			transparent = false,
		})
		require("neomodern").load("hojicha")
	end,
}
