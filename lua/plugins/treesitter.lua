return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-context" },
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	opts = {
		indent = { enable = true },
		highlight = { enable = true },
		folds = { enable = true },
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"css",
			"diff",
			"dockerfile",
			"gitignore",
			"html",
			"javascript",
			"json",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"python",
			"sql",
			"typescript",
			"tsx",
			"vim",
			"vimdoc",
			"yaml",
		},
	},
	config = function()
		local treesiter_ctx = require("treesitter-context")
		local ignore_filetype = {
			"checkhealth",
			"lazy",
			"mason",
			"TelescopePrompt",
			"alpha",
			"dashboard",
			"spectre_panel",
			"undotree",
			"Outline",
			"sagaoutline",
		}

		local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })

		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			desc = "Enable TreeSitter highlighting and indentation",
			callback = function(event)
				local ft = event.match

				if vim.tbl_contains(ignore_filetype, ft) then
					return
				end

				local lang = vim.treesitter.language.get_lang(ft) or ft
				local buf = event.buf
				pcall(vim.treesitter.start, buf, lang)

				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		treesiter_ctx.setup({
			enable = true,
			max_lines = 1,
			line_numbers = true,
			trim_scope = "outer",
			min_window_height = 0,
			mode = "cursor",
			separator = nil,
		})
	end,
}
