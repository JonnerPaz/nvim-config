return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
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
