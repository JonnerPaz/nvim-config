return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

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
	{ "jose-elias-alvarez/null-ls.nvim", config = require("lsp.null_ls") }, -- Formatter
	-- Add icons to lsp completion
}
