return {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim", "mason-org/mason-lspconfig.nvim" },
	config = function()
		require("mason").setup()

		local servers = {
			"html",
			"cssls",
			"tailwindcss",
			"emmet_ls",
			"jsonls",
			-- "ts_ls",
			"basedpyright",
			"lua_ls",
			"prismals",
			"postgres_lsp",
			"yamlls",
			"clangd",
			"ruff",
		}

		local tools = {
			"cpptools",
			"debugpy",
			-- eslint_d = "eslint_d",
			"black",
		}

		vim.lsp.enable(servers)

		require("mason-tool-installer").setup({
			ensure_installed = servers,
		})
	end,
}
