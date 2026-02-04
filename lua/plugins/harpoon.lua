return {
	"ThePrimeagen/harpoon",
	event = "BufEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")

		-- Required
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add to Harpoon" })

		vim.keymap.set("n", "<leader>e", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon Toggle" })

		-- Travel to specific buffers
		vim.keymap.set("n", "<leader>7", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>8", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>9", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>0", function()
			harpoon:list():select(4)
		end)

		-- Travel to next and previous buffers
		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():next({ ui_nav_wrap = true })
		end)
		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():prev({ ui_nav_wrap = true })
		end)
	end,
}
