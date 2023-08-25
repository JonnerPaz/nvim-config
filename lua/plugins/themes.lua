return {
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
		config = require("themes.github"),
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		config = require("themes.catppuccin"),
	},
	{
		"loctvl842/monokai-pro.nvim",
		lazy = true,
		config = require("themes.monokai-pro"),
	},
	{
		"navarasu/onedark.nvim",
		lazy = true,
		config = require("themes.onedark"),
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		config = require("themes.kanagawa"),
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},
}
