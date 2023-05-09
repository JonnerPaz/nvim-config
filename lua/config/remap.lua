-- Keybindings file
-- Leader button
vim.g.mapleader = " "

-- Explore keymaps
-- Disable on favor of nvim-tree.
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Fugitive mappings
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- harpoon mappings
-- ../../plugin/harpoon.lua

-- telescope mappings
-- ../../plugin/telescope.lua

-- tree
vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeToggle)

-- trouble mappings
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- zen mappings
vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR>")
