return {
	{
		"projekt0n/github-nvim-theme",
		-- lazy = false, -- make sure we load this during startup if it is your main colorscheme
		-- priority = 1000, -- make sure to load this before all the other start plugins
		config = require("themes.github"),
	},
	{ "catppuccin/nvim", name = "catppuccin" }, -- Color Scheme
	{
		"loctvl842/monokai-pro.nvim",
		config = require("themes.monokai-pro"),
	},
	{
		"navarasu/onedark.nvim",
		config = require("themes.onedark"),
	},
	{
		"rebelot/kanagawa.nvim",
		config = require("themes.kanagawa"),
	},
}
