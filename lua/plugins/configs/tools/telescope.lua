-- Telescope mappings
return function()
	require("telescope").setup({
		defaults = {
			file_ignore_patterns = {
				".git",
				"node_modules",
				"dist",
				"package.lock",
			},
			layout_strategy = "horizontal",
			layout_config = {
				height = 0.9,
				width = 0.9,
				prompt_position = "bottom",
				preview_cutoff = 10,
				preview_width = 0.5,
			},
		},
	})

	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>ff", function()
		builtin.find_files({ hidden = true, no_ignore = true })
	end, { desc = "Find by Files" }) -- Generic fuzzy search
	local remap = vim.keymap.set
	remap("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
	remap("n", "<leader>fb", builtin.buffers, { desc = "Find by Buffers" })
	remap("n", "<leader>fc", builtin.commands, { desc = "Find Commands" })
	remap("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
	remap("n", "<leader>fo", builtin.vim_options, { desc = "Find vim options" })
	remap("n", "<leader>fe", builtin.autocommands, { desc = "Find Autocommands/Events" })
	remap("n", "<leader>ft", builtin.colorscheme, { desc = "Find Colorschemes" })
	remap("n", "<leader>fkm", builtin.keymaps, { desc = "Find Keymaps" })
	remap("n", "<leader>fl", builtin.treesitter, { desc = "Find words by TS" })
	remap("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Find Word" })

	--[[ vim.keymap.set("n", "<leader>fg", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") }) -- search given word on each file
  end, { desc = "Find by Name" }) ]]
	-- vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find by Old Files" }) -- list old files
end
