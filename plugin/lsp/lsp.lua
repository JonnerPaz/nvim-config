local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities =
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

-- Old capabilities
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.preset({
	name = "recommended",
	float_border = "rounded",
	call_servers = "local",
	configure_diagnostics = true,
	setup_servers_on_start = true,
	set_lsp_keymaps = {
		preserve_mappings = false,
		omit = {},
	},
	manage_nvim_cmp = {
		set_sources = "recommended",
		set_basic_mappings = true,
		set_extra_mappings = false,
		use_luasnip = true,
		set_format = true,
		documentation_window = true,
	},
})

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"html",
	"cssls",
	"lua_ls",
})

lsp.set_preferences({
	sign_icons = { "*" },
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	-- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	-- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<F2>", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", opts)
end)

lspconfig.emmet_ls.setup({
	-- on_attach = on_attach,
	capabilities = lsp_defaults.capabilities,
	filetypes = { "css", "html", "javascript", "javascriptreact", "sass", "scss", "pug", "typescriptreact" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})

-- configure html server
lspconfig["html"].setup({
	capabilities = lsp_defaults.capabilities,
	on_attach = lsp.on_attach,
})

-- configure tsserver
lspconfig.tsserver.setup({
	on_attach = lsp.on_attach,
	capabilities = lsp_defaults.capabilities,
	settings = {
		completions = {
			completeFunctionCalls = true,
		},
	},
})
-- configure css server
lspconfig["cssls"].setup({
	capabilities = lsp_defaults.capabilities,
	on_attach = lsp.on_attach,
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = lsp_defaults.capabilities,
	on_attach = lsp.on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
