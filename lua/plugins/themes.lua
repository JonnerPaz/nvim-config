return {
	{
		"catppuccin/nvim",
		priority = 1000,
		name = "catppuccin",
		config = require("themes.catppuccin"),
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		config = function()
			vim.g.moonflyVirtualTextColor = true
			vim.g.moonflyUnderlineMatchParen = true
			vim.g.moonflyNormalFloat = true
		end,
	},
	{ "dgox16/oldworld.nvim" },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = require("plugins.configs.themes.rose_pine"),
	},
}
