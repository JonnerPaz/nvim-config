return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"cpp",
				"html",
				"css",
				"json",
				"lua",
				"python",
				"scss",
				"tsx",
				"javascript",
				"typescript",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
