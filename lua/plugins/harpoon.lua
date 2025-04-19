return {
	"ThePrimeagen/harpoon",
	event = "BufEnter",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add to Harpoon" })
		vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, { desc = "Harpoon Toggle" })
		vim.keymap.set("n", "<C-j>", function()
			ui.nav_next()
		end)
		vim.keymap.set("n", "<C-k>", function()
			ui.nav_prev()
		end)
	end,
}
