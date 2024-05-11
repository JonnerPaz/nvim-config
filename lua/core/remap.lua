-- Keybindings file
-- Leader button
vim.g.mapleader = " "

-- Explore keymaps
-- Disable on favor of nvim-tree.
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Hard maps
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- rezising
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
