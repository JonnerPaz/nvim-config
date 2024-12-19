return {
	{
		"catppuccin/nvim",
		priority = 1000,
		name = "catppuccin",
		config = require("themes.catppuccin"),
	},
	{ "bluz71/vim-moonfly-colors", name = "moonfly" },
	"dgox16/oldworld.nvim",
	{ "rebelot/kanagawa.nvim", config = require("plugins.configs.themes.kanagawa") },
}
