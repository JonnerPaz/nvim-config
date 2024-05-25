return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- progress bar
			{ "j-hui/fidget.nvim", opts = {} },

			-- Autoformatting
			{ "stevearc/conform.nvim", config = require("plugins.configs.lsp.conform") },

			-- Schema information
			"b0o/SchemaStore.nvim",
		},
		config = require("plugins.configs.lsp.lsp"),
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		priority = 100,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = require("plugins.configs.lsp.cmp"),
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = require("lsp.conform"),
	},
}
