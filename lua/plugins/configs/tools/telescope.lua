-- Telescope mappings
return function () 
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- Generic fuzzy search
vim.keymap.set("n", "<leader>fg", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") }) -- search given word on each file
end)
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {}) -- list old files
end 
