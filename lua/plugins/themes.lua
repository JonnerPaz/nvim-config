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
		lazy = true,
	},
	{
		"rebelot/kanagawa.nvim",
		config = require("themes.kanagawa"),
		lazy = true,
	},
	{
		"folke/tokyonight.nvim",
		-- priority = 1000,
		lazy = true,
	},
	{ "EdenEast/nightfox.nvim" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "Shatur/neovim-ayu" },
	{ "bluz71/vim-moonfly-colors", name = "moonfly" },
}
