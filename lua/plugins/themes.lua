return {
	{
		"catppuccin/nvim",
		priority = 1000,
		name = "catppuccin",
		config = require("themes.catppuccin"),
	},
	{
		"navarasu/onedark.nvim",
		config = require("themes.onedark"),
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
	},
	{ "EdenEast/nightfox.nvim" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "bluz71/vim-moonfly-colors", name = "moonfly" },
	{ "ellisonleao/gruvbox.nvim", config = true },
}
