local ui = {
	--[[ {
		"tjdevries/express_line.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = require("ui.express-line"),
	}, ]]
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("plugins.configs.ui.lualine"),
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
		event = "VeryLazy",
		config = require("ui.which-key"),
	},
	{
		"folke/zen-mode.nvim", -- zen mode
		event = "VeryLazy",
		config = require("ui.zen"),
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		keys = {
			{ "<leader>ti", "<cmd>IBLToggle<cr>", desc = "IBL Toggle" },
		},
		config = require("plugins.configs.ui.ibl"),
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "LspAttach",
		config = function()
			require("gitsigns").setup()
		end,
	},
}
return ui
