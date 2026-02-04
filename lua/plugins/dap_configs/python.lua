return {
	{
		"mfussenegger/nvim-dap-python",
		optional = true,
		dependencies = {
			"mfussenegger/nvim-dap",
		},

		config = function()
			local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},
}
