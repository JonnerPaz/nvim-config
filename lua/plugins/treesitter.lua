return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
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
			"rust",
			"sql",
			"typescript",
			"tsx",
			"vim",
			"vimdoc",
			"yaml",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter")

		require("nvim-treesitter-textobjects").setup({
			select = {
				enable = true,
				lookahead = true,
				selection_modes = {
					["@parameter.outer"] = "v",
					["@function.outer"] = "V",
					["@class.outer"] = "V",
				},
			},
		})

		local select = require("nvim-treesitter-textobjects.select")
		vim.keymap.set({ "x", "o" }, "af", function()
			select.select_textobject("@function.outer", "textobjects")
		end, { desc = "around function" })
		vim.keymap.set({ "x", "o" }, "if", function()
			select.select_textobject("@function.inner", "textobjects")
		end, { desc = "inner function" })
		vim.keymap.set({ "x", "o" }, "ac", function()
			select.select_textobject("@class.outer", "textobjects")
		end, { desc = "around class" })
		vim.keymap.set({ "x", "o" }, "ic", function()
			select.select_textobject("@class.inner", "textobjects")
		end, { desc = "inner class" })
		vim.keymap.set({ "x", "o" }, "al", function()
			select.select_textobject("@loop.outer", "textobjects")
		end, { desc = "around loop" })
		vim.keymap.set({ "x", "o" }, "il", function()
			select.select_textobject("@loop.inner", "textobjects")
		end, { desc = "inner loop" })
		vim.keymap.set({ "x", "o" }, "aP", function()
			select.select_textobject("@parameter.outer", "textobjects")
		end, { desc = "around parameter" })
		vim.keymap.set({ "x", "o" }, "iP", function()
			select.select_textobject("@parameter.inner", "textobjects")
		end, { desc = "inner parameter" })

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
				pcall(vim.treesitter.start, event.buf, lang)
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
