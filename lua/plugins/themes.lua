return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = require("themes.catppuccin"),
	},
	{
		"navarasu/onedark.nvim",
		config = require("themes.onedark"),
	},
	{
		"rebelot/kanagawa.nvim",
		config = require("themes.kanagawa"),
	},
	{
		"folke/tokyonight.nvim",
		-- priority = 1000,
	},
	{ "EdenEast/nightfox.nvim" }, -- lazy
	{ "rose-pine/neovim", name = "rose-pine" },
}
