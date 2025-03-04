return function()
	require("codeium").setup({
		enabled_cmp_source = false,
		virtual_text = {
			enabled = true,
			key_bindings = {
				accept = "<Tab>",
			},
		},
	})
end
