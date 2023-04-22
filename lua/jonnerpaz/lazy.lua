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
  -- telescope to search from and for files
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  -- Color Scheme
  { "catppuccin/nvim", name = "catppuccin" },
  -- Comments
  {
    'numToStr/Comment.nvim',
    as = function()
      require('Comment').init()
    end
  },
  -- formatter
  -- require('packer').{ 'mhartington/formatter.nvim' },
  -- Treesitter
  {'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate'},
  -- Treesitter playground
  'nvim-treesitter/playground',
  -- Autotag
  'windwp/nvim-ts-autotag',
  -- Harpoon
  'ThePrimeagen/harpoon',
  --undotree
  'mbbill/undotree',
  --vim-fugitive
  'tpope/vim-fugitive',
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
