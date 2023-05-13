local wk = require("which-key")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.g.mapleader = " "

wk.register({
	-- Fugitive mapping
	["<leader>gs"] = { "<cmd>Git<CR>", "Vim fugitive" },
	-- Harpoon
	["<leader>a"] = { mark.add_file, "Harpoon add file" },
	["<c-e>"] = { ui.toggle_quick_menu, "Harpoon menu" },
	["<c-j>"] = { ui.nav_next(), "Harpoon next ocurrence" },
	["<c-k>"] = { ui.nav_prev(), "Harpoon previous ocurrence" },
	-- NvimTree
	["<c-b>"] = { "<cmd>NvimTreeToggle<CR>", "NvimTree" },
	-- Trouble
	["<leader>tt"] = { "<cmd>TroubleToggle<CR>", "Trouble" },
	-- UndoTree
	["<leader>u"] = { "<cmd>UndotreeToggle<CR>", "UndoTree" },
	-- Zen mode
	["<leader>zz"] = { "<cmd>ZenMode<CR>", "zen mode" },
})
