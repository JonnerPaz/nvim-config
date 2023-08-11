-- Keybindings file
-- Leader button
vim.g.mapleader = " "

-- Explore keymaps
-- Disable on favor of nvim-tree.
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Hard maps
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Fugitive mappings
vim.keymap.set("n", "<leader>us", vim.cmd.Git, { desc = "Git fugitive" })

-- harpoon mappings
-- ../../plugin/harpoon.lua

-- telescope mappings
-- ../../plugin/telescope.lua

-- tree
vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeToggle)

-- trouble mappings
vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>", { desc = "Trouble", silent = true, noremap = true })
--[[ vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true }) ]]

-- undotree
vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "UndoTreeToggle" })

-- zen mappings
vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR>", { desc = "Hacker Mode :)" })
