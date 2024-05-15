-- Keybindings file
-- Leader button
vim.g.mapleader = " "

-- Explore keymaps
-- Disable on favor of nvim-tree.
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
local opts = { noremap = true, silent = true }
local remap = vim.keymap.set

-- Hard maps
remap("n", "<C-u>", "<C-u>zz")
remap("n", "<C-d>", "<C-d>zz")
remap("v", "J", ":m '>+1<CR>gv=gv")
remap("v", "K", ":m '<-2<CR>gv=gv")
remap("n", "n", "nzzzv")
remap("n", "N", "Nzzzv")

-- rezising
remap("n", "<C-Up>", ":resize -2<CR>", opts)
remap("n", "<C-Down>", ":resize +2<CR>", opts)
remap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
remap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
