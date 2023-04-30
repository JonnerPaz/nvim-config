-- This file can be loaded by calling from your init.vim
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
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

return require("lazy").setup({
	-- Look and feel
	{ "catppuccin/nvim", name = "catppuccin" }, -- Color Scheme
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},
	{
		"NvChad/nvim-colorizer.lua", -- Add colors to words, blue
		lazy = true,
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"onsails/lspkind.nvim", -- Add icons to lsp completion

	-- Search and navigation
	{
		"nvim-telescope/telescope.nvim", -- Search from and for files
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	"nvim-tree/nvim-tree.lua", -- Tree
	{
		"ThePrimeagen/harpoon",
		lazy = true,
	},
	"RRethy/vim-illuminate", -- Show words references
	-- Lua
	{
		"folke/zen-mode.nvim", -- zen mode
	},

	-- Editing
	{
		"numToStr/Comment.nvim", -- Comments
		lazy = true,
	},
	{
		"windwp/nvim-ts-autotag",
		lazy = true,
	},
	"windwp/nvim-autopairs",
	{
		"mbbill/undotree",
	}, -- Git like undotree
	"tpope/vim-surround",
	"jose-elias-alvarez/null-ls.nvim", -- Formatter

	-- Git integration
	{
		"tpope/vim-fugitive",
		lazy = true,
	},

	-- LSP
	-- LSP zero STARTS HERE
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			"williamboman/mason.nvim",
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-buffer", lazy = true },
			{ "hrsh7th/cmp-path", lazy = true },
			{
				"hrsh7th/cmp-nvim-lsp",
				dependencies = {
					--Snippets
					{ "L3MON4D3/LuaSnip" }, -- Required
					{ "saadparwaiz1/cmp_luasnip" },
					{ "rafamadriz/friendly-snippets" },
				},
			}, -- Required
		},
		lazy = true,
	},
})
