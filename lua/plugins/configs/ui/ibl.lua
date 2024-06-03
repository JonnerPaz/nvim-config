return function()
	return require("ibl").setup({
		debounce = 100,
		indent = { char = "│" },
		-- whitespace = { highlight = { "Whitespace", "NonText" } },
		scope = {
			show_exact_scope = true,
			include = { node_type = { typescript = "block" } },
			-- exclude = { lua = { "block" } },
		},
	})
end
