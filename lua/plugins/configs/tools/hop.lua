return function()
	local hop = require("hop")
	vim.keymap.set("n", "f", function()
		hop.hint_words({
			current_line_only = false,
			virtual_cursor = true,
			jump_on_sole_occurrence = true,
			-- uppercase_labels = true,
		})
	end, { remap = true })

	return require("hop").setup()
end
