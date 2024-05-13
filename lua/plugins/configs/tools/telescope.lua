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
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
	vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find by Buffers" })
	vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Find Commands" })
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
	vim.keymap.set("n", "<leader>fo", builtin.vim_options, { desc = "Find vim options" })
	vim.keymap.set("n", "<leader>fa", builtin.autocommands, { desc = "Find Autocommands" })
	vim.keymap.set("n", "<leader>ft", builtin.colorscheme, { desc = "Find Colorschemes" })
	vim.keymap.set("n", "<leader>fkm", builtin.keymaps, { desc = "Find Keymaps" })
	vim.keymap.set("n", "<leader>fl", builtin.treesitter, { desc = "Find Keymaps" })

	--[[ vim.keymap.set("n", "<leader>fg", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") }) -- search given word on each file
  end, { desc = "Find by Name" }) ]]
	-- vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find by Old Files" }) -- list old files
end
