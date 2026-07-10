local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- lazypath is the first one rtp shows
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins.themes" },
		{ import = "plugins.lsp" },
		{ import = "plugins.dap_configs" },
		{ import = "plugins" },
	},
}, {
	ui = {
		border = "rounded",
	},
	install = {
		colorscheme = { "rose-pine-moon" },
	},

	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"osc52",
				"rplugin",
			},
		},
	},
})
