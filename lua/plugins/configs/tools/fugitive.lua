-- Fugitive mappings
return function()
	vim.keymap.set("n", "<leader>us", vim.cmd.Git, { desc = "Git fugitive" })
end
