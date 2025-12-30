-- Using Lazy
return {
	"navarasu/onedark.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("onedark").setup({
			style = "warmer",
			transparent = true,
			highlights = {
				BlinkCmpMenuSelection = { fg = "#121212", bg = "#999999" },
			},
		})
		require("onedark").load()
	end,
}
