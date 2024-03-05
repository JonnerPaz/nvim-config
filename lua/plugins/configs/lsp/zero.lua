return function()
	local lsp_zero = require("lsp-zero")
	local lspconfig = require("lspconfig")
	local cmp = require("cmp")
	local cmp_select = { behavior = cmp.SelectBehavior.Select }
	local lsp_defaults = lspconfig.util.default_config
	lsp_defaults.capabilities =
		vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

	-- folding capabilities
	lsp_defaults.capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

	lsp_zero.on_attach(function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }
		local bind = vim.keymap.set
		bind("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		bind("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		bind("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		bind("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		bind("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		bind("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		bind("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		bind("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		bind({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		bind("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		bind("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		bind("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
		bind("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
	end)

	--[[ lsp_zero.set_sign_icons({
		error = "✘",
		warn = "▲",
		hint = "⚑",
		info = "»",
	}) ]]

	require("mason").setup({})

	require("mason-lspconfig").setup({
		ensure_installed = {
			"tsserver",
			"eslint",
			"html",
			"cssls",
			"lua_ls",
			"emmet_language_server",
		},

		handlers = {
			lsp_zero.default_setup,
			lua_ls = function()
				local lua_opts = lsp_zero.nvim_lua_ls()
				lspconfig.lua_ls.setup(lua_opts)
			end,
			html = function()
				lspconfig["html"].setup({
					capabilities = lsp_defaults.capabilities,
					on_attach = lsp_zero.on_attach,
				})
			end,
			cssls = function()
				lspconfig["cssls"].setup({
					capabilities = lsp_defaults.capabilities,
					on_attach = lsp_zero.on_attach,
				})
			end,
			tsserver = function()
				lspconfig.tsserver.setup({
					capabilities = lsp_defaults.capabilities,
					on_attach = lsp_zero.on_attach,
					settings = {
						completions = {
							completeFunctionCalls = true,
						},
					},
				})
			end,
			jsonls = function()
				lspconfig["jsonls"].setup({
					capabilities = lsp_defaults.capabilities,
					on_attach = lsp_zero.on_attach,
					single_file_support = true,
				})
			end,
			eslint = function()
				lspconfig["eslint"].setup({
					capabilities = lsp_defaults.capabilities,
					on_attach = lsp_zero.on_attach,
					single_file_support = true,
				})
			end,
			emmet_language_server = function()
				lspconfig.emmet_language_server.setup({})
			end,
		},
	})

	lsp_zero.setup()

	vim.diagnostic.config({
		virtual_text = true,
	})

	-- import luasnip plugin safely
	local luasnip_status, luasnip = pcall(require, "luasnip")
	if not luasnip_status then
		return
	end

	-- import lspkind plugin safely
	local lspkind_status, lspkind = pcall(require, "lspkind")
	if not lspkind_status then
		return
	end

	-- load vs-code like snippets from plugins (e.g. friendly-snippets)
	require("luasnip/loaders/from_vscode").lazy_load()

	-- Configure cmp
	local cmp_mappings = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
		["<TAB>"] = cmp.mapping.select_next_item(cmp_select),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-Space>"] = cmp.mapping.complete(),
	})
	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		sources = {
			{ name = "nvim_lsp" }, -- lsp
			{ name = "luasnip" }, -- snippets
			{ name = "buffer" }, -- text within current buffer
			{ name = "path" }, -- file system paths
		},
		mapping = cmp_mappings,
		formatting = {
			fields = { "abbr", "kind", "menu" },
			format = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 70, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			}),
		},
	})
end
