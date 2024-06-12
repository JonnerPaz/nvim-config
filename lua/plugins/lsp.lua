return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- progress bar
			{ "j-hui/fidget.nvim", opts = {} },

			-- Autoformatting
			{ "stevearc/conform.nvim", config = require("plugins.configs.lsp.conform") },

			-- Schema information
			"b0o/SchemaStore.nvim",
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = { "luvit-meta/library" },
				},
			},
			{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
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
		-- Formatter
		"stevearc/conform.nvim",
		event = "LspAttach",
		config = require("plugins.configs.lsp.conform"),
	},
}
