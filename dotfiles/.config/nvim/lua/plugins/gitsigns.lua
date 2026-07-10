return {
	"lewis6991/gitsigns.nvim",
	event = "LspAttach",
	config = function()
		require("gitsigns").setup()
	end,
}
