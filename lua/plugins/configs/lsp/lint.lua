return function()
	vim.env.ESLINT_D_PPID = vim.fn.getpid()
	local linter = require("lint")

	linter.linters_by_ft = {
		typescript = { "eslint_d" },
		javascript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescriptreact = { "eslint_d" },
	}

	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		callback = function()
			linter.try_lint()
		end,
	})
end
