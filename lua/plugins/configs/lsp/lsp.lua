return function()
	-- configure ui for cmp
	vim.diagnostic.config({
		signs = true,
		underline = true,
		virtual_text = true,
		update_in_insert = true,
		severity_sort = true,
		float = {
			-- UI.
			-- header = false,
			border = "rounded",
			focusable = true,
		},
	})

	local capabilities = nil
	if pcall(require, "cmp_nvim_lsp") then
		capabilities = require("cmp_nvim_lsp").default_capabilities()
	end

	local servers = {
		ts_ls = true,
		html = true,
		cssls = true,
		emmet_language_server = true,
		bashls = true,

		lua_ls = {
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
		},

		jsonls = {
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		},
	}

	-- inspect servers and if it has config
	-- installs it manually in mason
	-- if not just return default config
	local servers_to_install = vim.tbl_filter(function(server_key)
		local tbl = servers[server_key]
		if type(tbl) == "table" then
			return not tbl.manual_install
		else
			return tbl
		end
	end, vim.tbl_keys(servers))

	local ensure_installed = {
		"html",
		"cssls",
		"lua_ls",
		"emmet_language_server",
	}

	-- merge ensure_installed and servers_to_install into
	-- one tbl, which is ensure_installed
	vim.list_extend(ensure_installed, servers_to_install)

	require("mason").setup()
	require("mason-tool-installer").setup({
		ensure_installed = ensure_installed,
	})
	local lspconfig = require("lspconfig") -- requires it but not call it

	-- starts lspserver on each servers on servers
	for name, config in pairs(servers) do
		if config == true then
			config = {}
		end
		config = vim.tbl_deep_extend("force", {}, {
			capabilities = capabilities,
		}, config)

		lspconfig[name].setup(config)
	end

	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local bufnr = args.buf
			local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have a valid client")
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
			bind("n", "gs", vim.lsp.buf.signature_help, opts("Go signatures"))

			bind("n", "<F2>", vim.lsp.buf.rename, opts("Rename symbol"))
			bind("n", "<F3>", vim.lsp.buf.code_action, opts("Code Action"))
			bind("n", "gl", vim.diagnostic.open_float, opts("Diagnostic float"))
			bind("n", "[d", vim.diagnostic.goto_next, opts("Go next diagnostic"))
			bind("n", "]d", vim.diagnostic.goto_prev, opts("Go prev diagnostic"))
		end,
	})
end
