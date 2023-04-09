-- This file can be loaded by calling  from your init.vim

-- Only required if you have packer configured as `opt` 
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- telescope to search from and for files
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Color Scheme
  use { "catppuccin/nvim", as = "catppuccin" }
  -- Treesitter
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  -- Treesitter playground
  use ('nvim-treesitter/playground')
  -- Harpoon
  use ('ThePrimeagen/harpoon')
  --undotree
  use 'mbbill/undotree'
  --vim-fugitive
  use 'tpope/vim-fugitive'
  -- LSP zero STARTS HERE
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}
end)
