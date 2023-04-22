-- Telescope mappings
local builtin = require('telescope.builtin')
-- generic fuzzy search
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- Search between git_files REMEMBER change keyword before uncomment
-- vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

-- search given word on each file 
vim.keymap.set('n', '<leader>fg', function()
	builtin.grep_string({search = vim.fn.input("Grep > ") });
end)
-- list old files
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
