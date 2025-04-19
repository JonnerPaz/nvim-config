return {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "BufEnter",
	config = function()
		require("codeium").setup({
			enabled_cmp_source = true,
			enable_chat = true,
			workspace_root = {
				use_lsp = true,
				paths = {
					".git",
					"package.json",
				},
			},
			virtual_text = {
				enabled = function()
					local path = vim.api.nvim_buf_get_name(0)
					if string.find(path, "oil://", 1, true) == 1 then
						return false
					end
					return true
				end,
				key_bindings = {
					accept = "<Tab>",
					next = "<M-{>",
					prev = "<M-}>",
				},
			},
		})
	end,
}
