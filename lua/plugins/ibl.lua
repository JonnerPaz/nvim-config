return {
	"lukas-reineke/indent-blankline.nvim",
	lazy = true,
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {},
	cmd = { "IBLEnable", "IBLDisable" },
	config = function(_, opts)
		require("ibl").setup(opts)
	end,
}
