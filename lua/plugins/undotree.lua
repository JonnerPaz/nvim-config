return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "UndoTreeToggle" })
	end,
	event = "LspAttach",
}
