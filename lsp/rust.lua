vim.lsp.config("rust_analyzer", {
	root_dir = function(fname)
		return vim.fs.root(fname, { ".git", "Cargo.toml", "rust-toolchain.toml" })
	end,
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
		},
	},
})
