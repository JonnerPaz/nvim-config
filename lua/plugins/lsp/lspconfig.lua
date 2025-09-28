return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		-- Typescript lsp
		{
			"pmizio/typescript-tools.nvim",
			dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
			opts = {},
		},
		{
			-- Improves lua workflow
			"folke/lazydev.nvim",
			dependencies = {
				"rcarriga/nvim-dap-ui",
			},
			config = function()
				require("lazydev").setup({
					library = { "nvim-dap-ui" },
				})
			end,
		},
	},
}
