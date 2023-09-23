local ui = {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup({ default = true })
			end,
		},
		config = require("ui.lualine"),
	},
	{
		"NvChad/nvim-colorizer.lua", -- Add colors to words, blue
		config = require("ui.colorPicker"),
		lazy = true,
		cmd = "ColorizerToggle",
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
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
}
return ui
