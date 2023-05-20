function ColorMyPencils(color)
	color = color or "github_dark_dimmed"
	-- color = color or "catppuccin"

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	-- setup must be called before loading
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
