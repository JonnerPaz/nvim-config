return {
	"forest-nvim/sequoia.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme sequoia") -- or 'sequoia-night' / 'sequoia-rise'
	end,
}
