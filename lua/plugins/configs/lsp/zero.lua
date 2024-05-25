return function()
	local lsp_zero = require("lsp-zero")
	local lspconfig = require("lspconfig")
	local cmp = require("cmp")
	local cmp_select = { behavior = cmp.SelectBehavior.Select }
	local lsp_defaults = lspconfig.util.default_config
	lsp_defaults.capabilities =
		vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

	-- Start zero declaration
	lsp_zero.on_attach(function(client, bufnr)
		local opts = function(desc)
			return { noremap = true, silent = true, buffer = bufnr, desc = desc }
		end
		local bind = vim.keymap.set
		bind("n", "K", vim.lsp.buf.hover, opts("display information on hover"))
		bind("n", "gd", vim.lsp.buf.definition, opts("Go to definition of symbol under cursor"))
		bind("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration of symbol under cursor"))
		bind("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation of a symbol"))
		bind("n", "gt", vim.lsp.buf.type_definition, opts("Go type definition"))
		bind("n", "gr", vim.lsp.buf.references, opts("Go references"))
		bind("n", "gs", vim.lsp.buf.signature_help, opts("signatures"))
		bind("n", "<F2>", vim.lsp.buf.rename, opts("Rename symbol"))
		bind("n", "<F4>", vim.lsp.buf.code_action, opts("Code Action"))
		bind("n", "gl", vim.diagnostic.open_float, opts("Diagnostic float"))
		bind("n", "[d", vim.diagnostic.goto_next, opts("Go next diagnostic"))
		bind("n", "]d", vim.diagnostic.goto_prev, opts("Go prev diagnostic"))
	end)

	-- Set up mason and lspconfig
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
				lspconfig.lua_ls.setup({
					lua_opts = lsp_zero.nvim_lua_ls(),
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
								disable = { "missing-fields" },
							},
							workspace = {
								-- make the language server aware of runtime files
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
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
			--[[ eslint = function()
				lspconfig["eslint"].setup({
					capabilities = lsp_defaults.capabilities,
					on_attach = lsp_zero.on_attach,
					single_file_support = true,
				})
			end, ]]
			emmet_language_server = function()
				lspconfig.emmet_language_server.setup({})
			end,
		},
	})

	-- Starts up lsp servers
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
