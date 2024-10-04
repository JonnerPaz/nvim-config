return function()
	return require("posterpole").setup({
		transparent = false,
		colorless_bg = true, -- grayscale or not
		dim_inactive = false, -- highlight inactive splits
		brightness = -5, -- negative numbers - darker, positive - lighter
		selected_tab_highlight = false, --highlight current selected tab
		fg_saturation = 5, -- font saturation, gray colors become more brighter
		bg_saturation = 9, -- background saturation
	})
end
