return {
	{
		"nvim-telescope/telescope.nvim", -- Search from and for files
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim" } },
		config = require("tools.telescope"),
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = require("tools.treesitter") },
	{
		"ThePrimeagen/harpoon",
		event = "BufEnter",
		config = require("tools.harpoon"),
	},
	{
		"numToStr/Comment.nvim",
		config = require("tools.comment"),
	},
	{
		"windwp/nvim-ts-autotag",
		config = require("tools.autotag"),
	},
	{
		"windwp/nvim-autopairs",
	},
	{
		"mbbill/undotree",
		config = require("tools.undotree"),
	},
	{ "sindrets/diffview.nvim", config = require("tools.diffview") },
	--[[ {
		"nvim-tree/nvim-tree.lua", -- Tree
		config = require("tools.tree"),
	}, ]]
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("tools.oil"),
	},
	{
		"RRethy/vim-illuminate",
	},
}
