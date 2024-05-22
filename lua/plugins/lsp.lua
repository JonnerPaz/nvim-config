return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				dependencies = {
					"williamboman/mason-lspconfig.nvim",
					{
						"WhoIsSethDaniel/mason-tool-installer.nvim",
						config = function()
							require("mason-tool-installer").setup({
								ensure_installed = {
									"prettierd",
									"prettier",
									"stylua",
								},
							})
						end,
					},
				},
			},
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-cmdline" },
			{ "onsails/lspkind.nvim" },
			{ "hrsh7th/cmp-path" },
			{
				"hrsh7th/cmp-nvim-lsp",
				dependencies = {
					{ "L3MON4D3/LuaSnip" }, -- Snippets
					{ "saadparwaiz1/cmp_luasnip" },
					{ "rafamadriz/friendly-snippets" },
				},
			},
		},
		config = require("lsp.zero"),
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = require("lsp.conform"),
	},
	{ "folke/neodev.nvim" },
}
