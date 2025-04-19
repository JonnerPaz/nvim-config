return {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	event = "BufEnter",
	config = function()
		require("codeium").setup({
			enabled_cmp_source = false,
			virtual_text = {
				enabled = true,
				key_bindings = {
					accept = "<Tab>",
				},
			},
		})
	end,
}
