return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	config = function()
		local treesitter = require("nvim-treesitter")
		local treesitter_cfg = require("nvim-treesitter.config")
		local parsers = require("nvim-treesitter.parsers")

		local ensure_installed = {
			"bash",
			"c",
			"comment",
			"css",
			"diff",
			"dockerfile",
			"git_config",
			"git_rebase",
			-- "gitcommit",
			"gitignore",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"lua",
			"luadoc",
			"markdown",
			"python",
			"sql",
			"typescript",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
			"zsh",
		}
		local installed = treesitter_cfg.get_installed()
		local to_install = vim.iter(ensure_installed)
			:filter(function(parser)
				return not vim.tbl_contains(installed, parser)
			end)
			:totable()

		if #to_install > 0 then
			treesitter.install(to_install)
		end

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
	end,
}
