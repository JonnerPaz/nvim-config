return {
	"tiagovla/tokyodark.nvim",
	opts = {},
	config = function(_, opts)
		require("tokyodark").setup({
			transparent_background = true,
			custom_highlights = {
				BlinkCmpMenuSelection = { fg = "#121212", bg = "#999999" },
			},
		}) -- calling setup is optional
		vim.cmd([[colorscheme tokyodark]])
	end,
}
