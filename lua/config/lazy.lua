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
  -- Color Scheme
  { "catppuccin/nvim",                 name = "catppuccin" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
  },
  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  -- scrollbar
  {
    "petertriho/nvim-scrollbar",
  },
  'onsails/lspkind.nvim', -- Add icons to lsp completion




  -- Search and navigation
  -- telescope to search from and for files
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    -- or                            , branch = '0.1.x',
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    lazy = true,
  },
  -- shows words references
  "RRethy/vim-illuminate",

  -- Editing
  {
    -- scrollbar
    {
      "petertriho/nvim-scrollbar",
    },
    "numToStr/Comment.nvim",
    lazy = true,
  },
  -- tree
  "nvim-tree/nvim-tree.lua",
  {
    "windwp/nvim-ts-autotag",
    lazy = true,
  },
  "windwp/nvim-autopairs",
  "mbbill/undotree",
  "tpope/vim-surround",



  -- Git integration
  "tpope/vim-fugitive",

  -- LSP
  -- LSP zero STARTS HERE
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },             -- Required
      "williamboman/mason.nvim",
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },     -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { 'hrsh7th/cmp-nvim-lua' },
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",

      --Snippets
      { "L3MON4D3/LuaSnip" }, -- Required
      { 'rafamadriz/friendly-snippets' },
    },
  },
})
