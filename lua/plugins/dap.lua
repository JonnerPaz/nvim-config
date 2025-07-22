return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"jay-babu/mason-nvim-dap.nvim",
		{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
		-- Python debugger
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			ensure_installed = { "codelldb" },
		})

		local dappy_status, dappy = pcall(require, "dap-python")
		if not dappy_status then
			return
		else
			dappy.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
		end

		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

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
