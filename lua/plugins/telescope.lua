return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    config = function() 
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
			border = false,
		},
	})

	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>f", function()
		builtin.find_files({ hidden = true, no_ignore = true })
	end, { desc = "Find by Files" }) -- Generic fuzzy search
	local remap = vim.keymap.set

	remap("n", "<leader>dg", builtin.live_grep, { desc = "Live grep" })
	remap("n", "<leader>db", builtin.buffers, { desc = "Find by Buffers" })
	remap("n", "<leader>dc", builtin.commands, { desc = "Find Commands" })
	remap("n", "<leader>dh", builtin.help_tags, { desc = "Find help tags" })
	remap("n", "<leader>de", builtin.autocommands, { desc = "Find Autocommands/Events" })
	remap("n", "<leader>dt", builtin.colorscheme, { desc = "Find Colorschemes" })
	remap("n", "<leader>dk", builtin.keymaps, { desc = "Find Keymaps" })
	remap("n", "<leader>df", builtin.diagnostics, { desc = "Find diagnostics" })

	--[[ vim.keymap.set("n", "<leader>fg", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") }) -- search given word on each file
  end, { desc = "Find by Name" }) ]]
	-- vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find by Old Files" }) -- list old files
end,
      dependencies = { 'nvim-lua/plenary.nvim' }
    }
