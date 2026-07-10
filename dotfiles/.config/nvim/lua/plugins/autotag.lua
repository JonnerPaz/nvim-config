return {
	"windwp/nvim-ts-autotag",
	dependencies = {
		"nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-textobjects",
		{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
		{
			"mawkler/jsx-element.nvim",
			ft = { "typescriptreact", "javascriptreact", "typescript", "javascript" },
		},
	},
	event = "LspAttach",
	config = function()
		require("nvim-autopairs").setup({
			map_cr = true,
		})

		require("nvim-ts-autotag").setup({
			opts = {
				-- Defaults
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
		})
	end,
}
