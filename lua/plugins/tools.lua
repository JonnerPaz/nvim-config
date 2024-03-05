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
		config = require("tools.harpoon"),
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = require("tools.trouble"),
		cmd = "Trouble",
	},
	{
		"numToStr/Comment.nvim", -- Comments
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
	{
		-- Git integration
		"tpope/vim-fugitive",
		config = require("tools.fugitive"),
		cmd = "Git",
	},
	{ "sindrets/diffview.nvim", cmd = "DiffViewOpen" },
	{
		"nvim-tree/nvim-tree.lua", -- Tree
		config = require("tools.tree"),
	},
	"RRethy/vim-illuminate", -- Show words references
}
