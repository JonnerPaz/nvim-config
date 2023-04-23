-- Keybindings file
-- Leader button
vim.g.mapleader = " "

-- Explore keymaps
-- Disable on favor of nvim-tree.
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Fugitive mappings
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
