return {
	{
		"nvim-telescope/telescope.nvim", -- Search from and for files
		tag = "0.1.1",
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
	}, -- Git like undotree
	{
		"tpope/vim-surround",
	},
	{
		-- Git integration
		"tpope/vim-fugitive",
		-- lazy = true,
	},
	{
		"nvim-tree/nvim-tree.lua", -- Tree
		config = require("tools.tree"),
	},
	"RRethy/vim-illuminate", -- Show words references
}
