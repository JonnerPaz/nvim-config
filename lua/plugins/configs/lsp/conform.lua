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
			javascript = {
				"prettierd",
				"prettier",
				stop_after_first = true,
				async = false,
				timeout_ms = 500,
			},
			typescript = {
				"prettierd",
				"prettier",
				stop_after_first = true,
				async = false,
				timeout_ms = 500,
			},
			javascriptreact = {
				"prettierd",
				"prettier",
				stop_after_first = true,
				async = false,
				timeout_ms = 500,
			},
			typescriptreact = {
				"prettierd",
				"prettier",
				stop_after_first = true,
				async = false,
				timeout_ms = 500,
			},
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

			conform.format()
		end,
		notify_on_error = true,
	})

	vim.keymap.set({ "n", "v" }, "<leader>lf", function()
		conform.format()
	end, { desc = "Format file baby" })
end
