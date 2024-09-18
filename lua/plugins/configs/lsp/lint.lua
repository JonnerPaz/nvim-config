return function()
	local linter = require("lint")

	linter.linters_by_ft = {
		bash = { "shellcheck" },
		typescript = { "eslint_d" },
		javascript = { "eslint_d" },
	}

	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		callback = function()
			return linter.try_lint()
		end,
	})
end
