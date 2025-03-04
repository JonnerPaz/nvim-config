return function()
	local linter = require("lint")

	linter.linters_by_ft = {
		typescript = { "eslint_d" },
		javascript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescriptreact = { "eslint_d" },
	}

	local eslintd_workdir = {
		".eslintrc.cjs",
		".eslint.config.js",
		".eslint.config.mjs",
		".eslint.config.cjs",
		".eslint.config.ts",
		".eslint.config.mts",
		".eslint.config.cts",
	}

	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		callback = function()
			for _, value in ipairs(eslintd_workdir) do
				local root_dir = vim.fs.find(value, { upward = true, path = vim.fn.expand("%") })[1]
				if root_dir then
					return linter.try_lint("eslint_d")
				end
			end
		end,
	})
end
