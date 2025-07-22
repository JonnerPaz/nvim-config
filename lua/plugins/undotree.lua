return {
	"mbbill/undotree",
	lazy = true,
	keys = { "<leader>uu" },
	config = function()
		vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "UndoTreeToggle" })
	end,
	event = "LspAttach",
}
