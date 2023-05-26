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
	},
	{
		"folke/zen-mode.nvim", -- zen mode
		config = require("ui.zen"),
	},
	{
		"folke/which-key.nvim",
		config = require("ui.which-key"),
	},
}
return ui
