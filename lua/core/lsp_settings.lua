vim.diagnostic.config({
	virtual_text = true,
	float = {
		border = "rounded",
		source = true,
	},
	underline = true,
	signs = true,
	update_in_insert = false,
	severity_sort = true,
})

local key_mappings = {
	{ "K", vim.lsp.buf.hover, "display information on hover" },
	{ "gd", vim.lsp.buf.definition, "Go to definition of symbol under cursor" },
	{ "gD", vim.lsp.buf.declaration, "Go to declaration of symbol under cursor" },
	{ "gi", vim.lsp.buf.implementation, "Go to implementation of a symbol" },
	{ "gt", vim.lsp.buf.type_definition, "Go type definition" },
	{ "gr", vim.lsp.buf.references, "Go references" },
	{ "gs", vim.lsp.buf.signature_help, "Go signatures" },

	{ "<F2>", vim.lsp.buf.rename, "Rename symbol" },
	{ "<F3>", vim.lsp.buf.code_action, "Code Action" },
	{ "gl", vim.diagnostic.open_float, "Diagnostic float" },

	{ "<leader>t", "<cmd>FzfLua lsp_typedefs<cr>", "Go type definition" },
	{ "<leader>f", "<cmd>FzfLua files<cr>", "check files baby" },
	{ "<leader>g", "<cmd>FzfLua live_grep<cr>", "Live grep" },
	{ "<leader>db", "<cmd>FzfLua buffers<cr>", "Find by Buffers" },
	{ "<leader>dc", "<cmd>FzfLua commands<cr>", "Find Commands" },
	{ "<leader>dh", "<cmd>FzfLua helptags<cr>", "Find help tags" },
	{ "<leader>de", "<cmd>FzfLua autocmds<cr>", "Find Autocommands/Events" },
	{ "<leader>dt", "<cmd>FzfLua colorschemes<cr>", "Find Colorschemes" },
	{ "<leader>dk", "<cmd>FzfLua keymaps<cr>", "Find Keymaps" },
	{ "<leader>df", "<cmd>FzfLua diagnostics_workspace<cr>", "Find diagnostics" },
	{
		"<leader>di",
		"<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
		"Toggle inlay hints",
	},
}

for _, mapping in pairs(key_mappings) do
	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", mapping[1], mapping[2], vim.tbl_extend("force", opts, { desc = mapping[3] }))
end
