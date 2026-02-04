return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",

			-- Python debugger
			"mfussenegger/nvim-dap-python",
		},
		opts = {},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			local dap_virtual_text = require("nvim-dap-virtual-text")
			dapui.setup()
			dap_virtual_text.setup({})

			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
			vim.keymap.set("n", "<F9>", dap.continue, { desc = "Continue" })
			vim.keymap.set("n", "<F10>", dap.step_into, { desc = "Step Into" })
			vim.keymap.set("n", "<F11>", dap.step_over, { desc = "Step Over" })
			vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>mr", dap.repl.open, { desc = "Open REPL" })
			-- vim.keymap.set("n", "<leader>dr", dappy.test_method, { desc = "PYDAP: Test Method" })
			-- vim.keymap.set("n", "<leader>ds", dappy.debug_selection, { desc = "PYDAP: Test Selection" })
		end,
	},

	-- Debugger UI
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		opts = {},
		config = function(_, opts)
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup(opts)
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
	},

	-- Mason integration
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "mason.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_installation = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = { "codelldb", "js-debug-adapter", "python" },
		},
		-- mason-nvim-dap is loaded when nvim-dap loads
		config = function() end,
	},
}
