--[[ return {
	cmd = { "clangd" },
	root_markers = { ".clangd", "compile_commands.json" },
	filetypes = { "c", "cpp" },
	root_dir = function()
		return vim.loop.cwd()
	end, -- Use project root
} ]]

vim.lsp.config.clangd = {
	cmd = {
		"clangd",
		"--clang-tidy",
		"--background-index",
		"--offset-encoding=utf-8",
	},
	root_markers = { ".clangd", "compile_commands.json" },
	filetypes = { "c", "cpp" },
}
