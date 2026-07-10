return {
	"dgox16/oldworld.nvim",
	config = function()
		return require("oldworld").setup({
			terminal_colors = true, -- enable terminal colors
			variant = "oled",
			styles = {
				booleans = { bold = true },
			},
			highlight_overrides = {
				-- bg = "#000000",
			},
		})
	end,
}
