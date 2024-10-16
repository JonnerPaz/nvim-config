return {
	{
		"nvim-telescope/telescope.nvim", -- Search from and for files
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim" } },
		config = require("tools.telescope"),
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = require("tools.treesitter"),
	},
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
		event = "LspAttach",
		config = require("tools.autotag"),
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"mbbill/undotree",
		config = require("tools.undotree"),
	},
	{
		"sindrets/diffview.nvim",
		lazy = true,
		config = require("tools.diffview"),
		cmd = "DiffViewOpen",
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("tools.oil"),
	},
	{
		"RRethy/vim-illuminate",
	},
	-- makes writing markdown in neovim better
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		config = require("tools.render-markdown"),
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}
