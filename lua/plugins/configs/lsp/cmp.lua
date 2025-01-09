return function()
	local cmp = require("cmp")
	local cmp_select = { behavior = cmp.SelectBehavior.Select }

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	local luasnip_status, luasnip = pcall(require, "luasnip")
	if not luasnip_status then
		return
	end

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
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
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
			-- { name = "copilot" }, -- copilot
			{ name = "luasnip" }, -- snippets
			{ name = "buffer" }, -- text within current buffer
			{ name = "path" }, -- file system paths
			{ name = "codeium" }, -- codeium
			{ name = "lazydev", group_index = 0 }, -- lazydev
		},
		mapping = cmp_mappings,
		formatting = {
			fields = { "abbr", "kind", "menu" },
			format = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 70, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
				symbol_map = { Codeium = " " },
			}),
		},
	})
end
