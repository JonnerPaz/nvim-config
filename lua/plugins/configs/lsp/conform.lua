return function()
	local conform = require("conform")

	local format_opts = {
		lsp_format = "fallback",
		stop_after_first = true,
		async = false,
		timeout_ms = 500,
	}

	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			javascriptreact = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
		},
		format_on_save = function(bufnr)
			-- Disable autoformat for files in a certain path
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			if bufname:match("/node_modules/") then
				return
			end

			return format_opts
		end,
		notify_on_error = true,
	})

	vim.keymap.set({ "n", "v" }, "<leader>lf", function()
		conform.format(format_opts)
	end, { desc = "Format file baby" })
end
