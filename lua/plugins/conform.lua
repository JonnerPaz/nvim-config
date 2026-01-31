return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
				python = { lsp_format = "prefer", "black", stop_after_first = true },
				cpp = { "clang-format" },
				sql = { "pg_format" },
			},
			formatters = {

				["clang-format"] = {
					prepend_args = {
						"-style={ \
          BasedOnStyle: llvm, \
          IndentWidth: 4, \
          ColumnLimit: 100, \
          AllowShortFunctionsOnASingleLine: None, \
          PointerAlignment: Left, \
          FixNamespaceComments: true, \
          SortIncludes: true, \
          BreakBeforeBraces: Attach \
        }",
					},
				},
			},
			format_on_save = function(bufnr)
				-- Disable autoformat for files in a certain path
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				if bufname:match("/node_modules/") then
					return
				end

				conform.format()
			end,
			notify_on_error = true,
		})

		vim.keymap.set({ "n" }, "<leader>l", function()
			conform.format()
		end, { desc = "Format file baby" })
	end,
}
