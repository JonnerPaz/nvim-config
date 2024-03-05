return function()
	local conform = require("conform")
	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		},
		notify_on_error = true,
	})

	vim.keymap.set({ "n", "v" }, "<leader>lf", function()
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		})
	end, { desc = "Format file baby" })
end
