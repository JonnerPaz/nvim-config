return {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim", "mason-org/mason-lspconfig.nvim" },
	config = function()
		require("mason").setup()

		local servers = {
			"html",
			"cssls",
			"emmet_ls",
			"jsonls",
			"basedpyright",
			"lua_ls",
			"prismals",
			"postgres_lsp",
			"yamlls",
			"clangd",
			"rust_analyzer",
			"ruff",
			"tsgo",
			"astro",
		}

		vim.lsp.enable(servers)

		require("mason-tool-installer").setup({
			ensure_installed = servers,
		})
	end,
}
