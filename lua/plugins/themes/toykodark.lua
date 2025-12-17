return {
	"tiagovla/tokyodark.nvim",
	opts = {},
	config = function(_, opts)
		require("tokyodark").setup({
			transparent_background = true,
		}) -- calling setup is optional
		vim.cmd([[colorscheme tokyodark]])
	end,
}
