return function()
	local filetype = {
		"filetype",
		colored = false,
		icon_only = true,
		icon = { align = "right" },
	}

	return require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = "",
			section_separators = "",
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			always_show_tabline = true,
			globalstatus = false,
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diagnostics" },
			lualine_c = { { "filename", path = 1 } },
			lualine_x = {},
			lualine_y = { filetype, "diff" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = { { "filename", path = 1 } },
			lualine_b = {},
			lualine_c = {},
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	})
end
