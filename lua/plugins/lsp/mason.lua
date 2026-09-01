return {
	"williamboman/mason.nvim",
	dependencies = { "mason-org/mason-lspconfig.nvim" },
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
			"tsc",
			"astro",
			"marksman",
			"tailwindcss",
		}

		-- Additional tools (formatters/linters) not managed via vim.lsp.enable
		local tools = {
			"rustywind",
			"stylua",
			"prettierd",
			"eslint_d",
		}

		vim.lsp.enable(servers)

		require("mason-tool-installer").setup({
			ensure_installed = vim.list_extend(vim.deepcopy(servers), tools),
		})
	end,
}
