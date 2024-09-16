return function()
	require("nvim-treesitter.configs").setup({
		-- A list of parser names, or "all" (the five listed parsers should always be installed)
		ensure_installed = {
			"javascript",
			"typescript",
			"lua",
			"vim",
			"http",
			"vimdoc",
			"query",
			"markdown",
			"scss",
			"css",
			"html",
			"json",
			"json5",
			"tsx",
			"gitcommit",
			"bash",
			"gitignore",
		},
		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = true,
		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = false,
		highlight = {
			enable = true,
			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
		rainbow = {
			enable = false,
			extended_mode = true,
		},
		-- from the ts-autotag plugin
		autotag = {
			enable = true,
		},
	})
end
