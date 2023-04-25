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

vim.g.mapleader = ' '

return require('lazy').setup({
  -- Look and feel
  -- Color Scheme
  { "catppuccin/nvim", name = "catppuccin" },
  {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },
  {
    'NvChad/nvim-colorizer.lua',
    lazy = true
  },
  -- Treesitter
  {'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate'},



  -- Search and navigation
  -- telescope to search from and for files
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  -- Harpoon
  {
    'ThePrimeagen/harpoon',
    lazy = true
  },
  -- shows words references
  'RRethy/vim-illuminate',



  -- Editing
  {
    'numToStr/Comment.nvim',
    lazy = true
  },
  -- formatter
  -- tree
  'nvim-tree/nvim-tree.lua',
  -- scrollbar
  {
    "petertriho/nvim-scrollbar",
  },
  {
    'windwp/nvim-ts-autotag',
    lazy = true
  },
  'mbbill/undotree',



  -- Git integration 
  'tpope/vim-fugitive',



  -- LSP
  -- LSP zero STARTS HERE
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
},
})
