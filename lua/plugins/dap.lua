return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"jay-babu/mason-nvim-dap.nvim",
		{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			ensure_installed = { "codelldb" },
		})

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

		vim.keymap.set("n", "<F1>", dap.continue, { desc = "Continue" })
		vim.keymap.set("n", "<F2>", dap.step_into, { desc = "Step Into" })
		vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Step Over" })
		vim.keymap.set("n", "<F4>", dap.step_out, { desc = "Step Out" })
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>mr", dap.repl.open, { desc = "Open REPL" })
	end,
}
