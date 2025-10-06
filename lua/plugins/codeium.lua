return {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "BufEnter",
	config = function()
		require("codeium").setup({
			workspace_root = {
				use_lsp = true,
				paths = {
					".git",
					"package.json",
				},
			},
			enable_chat = true,
			enable_cmp_source = false,
			virtual_text = {
				enabled = function()
					local path = vim.api.nvim_buf_get_name(0)
					if string.find(path, "oil", 1, true) == 1 then
						return false
					end
					return true
				end,
				key_bindings = {
					accept = "<Tab>",
					next = "<M-{>",
					prev = "<M-}>",
				},
				filetypes = {
					["typescript"] = true,
					["oil"] = false,
				},
				virtual_text_priority = 1000,
				map_keys = true,
				default_filetype_enabled = true,
			},
		})
	end,
}
