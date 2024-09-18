local ui = {
	{
		"tjdevries/express_line.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = require("ui.express-line"),
	},
	{
		"NvChad/nvim-colorizer.lua", -- Add colors to words, blue,
		config = require("ui.colorPicker"),
		lazy = true,
		cmd = "ColorizerToggle",
	},
	{
		"folke/todo-comments.nvim",
		cmd = "TodoTelescope",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("ui.todo-comments"),
	},
	{
		"folke/which-key.nvim",
		config = require("ui.which-key"),
		event = "VeryLazy",
	},
	{
		"folke/zen-mode.nvim", -- zen mode
		config = require("ui.zen"),
		event = "VeryLazy",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "VeryLazy",
		config = require("plugins.configs.ui.ibl"),
	},
}
return ui
