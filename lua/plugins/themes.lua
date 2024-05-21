return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = require("themes.catppuccin"),
		lazy = true,
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
}
