return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			"williamboman/mason.nvim",
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp", config = require("lsp.cmp") }, -- Required
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-buffer", lazy = true },
			{ "hrsh7th/cmp-path", lazy = true },
			{
				"hrsh7th/cmp-nvim-lsp",
				dependencies = {
					--Snippets
					{ "L3MON4D3/LuaSnip" }, -- Required
					{ "saadparwaiz1/cmp_luasnip" },
					{ "rafamadriz/friendly-snippets" },
				},
			}, -- Required
		},
		config = require("lsp.zero"),
	},
	{ "jose-elias-alvarez/null-ls.nvim", config = require("lsp.null_ls") }, -- Formatter
	"onsails/lspkind.nvim", -- Add icons to lsp completion
}
