return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"jay-babu/mason-nvim-dap.nvim",
		"igorlfs/nvim-dap-view",
		-- { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
		-- Python debugger
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		-- local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			ensure_installed = { "codelldb", "js-debug-adapter" },
		})

		-- Python debugger --
		local dappy_status, dappy = pcall(require, "dap-python")
		if not dappy_status then
			return
		else
			dappy.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
		end
		-- Python debugger --

		-- dapui.setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			vim.api.nvim_command("DapViewOpen")
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			vim.api.nvim_command("DapViewClose")
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			vim.api.nvim_command("DapViewClose")
		end

		-- js-debug-adapter
		local js_dap_path = "~/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"

		if not dap.adapters["pwa-node"] then
			dap.adapters["pwa-node"] = {
				type = "server",
				host = "127.0.0.1",
				port = 8123,
				executable = {
					command = "js-debug-adapter",
					-- args = { js_dap_path, "${port}" },
				},
			}
		end

		if not dap.adapters["node"] then
			dap.adapters["node"] = function(cb, config)
				if config.type == "node" then
					config.type = "pwa-node"
				end

				local nativeAdapter = dap.adapters["pwa-node"]
				if type(nativeAdapter) == "function" then
					nativeAdapter(cb, config)
				else
					cb(nativeAdapter)
				end
			end
		end

		local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

		local vscode = require("dap.ext.vscode")
		local json = require("plenary.json")
		local current_file = vim.fn.expand("%:t")
		vscode.type_to_filetypes["node"] = js_filetypes
		vscode.type_to_filetypes["pwa-node"] = js_filetypes

		vscode.json_decode = function(str)
			return vim.json.decode(json.json_strip_comments(str))
		end

		for _, language in ipairs(js_filetypes) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
				{
					name = "tsx (" .. current_file .. ")",
					type = "node",
					request = "launch",
					program = "${file}",
					runtimeExecutable = "tsx",
					cwd = "${workspaceFolder}",
					console = "integratedTerminal",
					internalConsoleOptions = "neverOpen",
					skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
				},
			}
		end
		-- js-debug-adapter

		dap.adapters.cppdbg = require("plugins.dap_configs.cppdap").dap.adapters.cppdbg
		dap.configurations.cpp = require("plugins.dap_configs.cppdap").dap.configurations.cpp

		vim.keymap.set("n", "<F9>", dap.continue, { desc = "Continue" })
		vim.keymap.set("n", "<F10>", dap.step_into, { desc = "Step Into" })
		vim.keymap.set("n", "<F11>", dap.step_over, { desc = "Step Over" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>mr", dap.repl.open, { desc = "Open REPL" })
		vim.keymap.set("n", "<leader>dr", dappy.test_method, { desc = "PYDAP: Test Method" })
		vim.keymap.set("n", "<leader>ds", dappy.debug_selection, { desc = "PYDAP: Test Selection" })
	end,
}
