return {
	{
		"catppuccin/nvim",
		priority = 1000,
		name = "catppuccin",
		config = require("themes.catppuccin"),
	},
	{ "bluz71/vim-moonfly-colors", name = "moonfly" },
	{ "dgox16/oldworld.nvim" },
	{ "ilof2/posterpole.nvim", config = require("themes.posterpole") },
}
