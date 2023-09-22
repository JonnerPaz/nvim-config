-- Telescope mappings
return function()
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find by Files" }) -- Generic fuzzy search
	vim.keymap.set("n", "<leader>fg", function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") }) -- search given word on each file
	end, { desc = "Find by Name" })
	vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find by Old Files" }) -- list old files

	vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find by Buffers" })

	vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Find Commands" })

	vim.keymap.set("n", "<leader>ft", builtin.commands, { desc = "Find Commands" })
end
