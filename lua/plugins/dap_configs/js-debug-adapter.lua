return {
	dap = {
		adapters = {
			["js-debug-adapter"] = {
				type = "executable",
				command = "node",
				-- args = { "/home/jonnerpaz/.local/share/nvim/mason/packages/js-debug-adapter/out/debugAdapter.js" },
			},
		},

		configurations = {
			javascript = {
				{
					name = "Launch file",
					type = "js-debug-adapter",
					request = "launch",
					program = "${file}",
					cwd = "${workspaceFolder}",
					sourceMaps = true,
					protocol = "inspector",
					console = "integratedTerminal",
				},
			},

			typescript = {
				{
					name = "Launch file",
					type = "js-debug-adapter",
					request = "launch",
					program = "${file}",
					cwd = "${workspaceFolder}",
					sourceMaps = true,
					protocol = "inspector",
					console = "integratedTerminal",
				},
			},
		},
	},
}
