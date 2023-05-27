local vim = vim.opt
-- Makes cursor big when typing
vim.guicursor = ""

-- Numbers and relative numbers
vim.nu = true
vim.relativenumber = true

-- Indentation
vim.tabstop = 2
vim.softtabstop = 2
vim.shiftwidth = 2
vim.expandtab = true
vim.smartindent = true

-- Lines won't wrap when splitting windows
vim.wrap = false

-- Get rid of swap file and backups
vim.swapfile = false
vim.backup = false
vim.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.undofile = true

-- Search text options
vim.hlsearch = true
vim.incsearch = true

vim.termguicolors = true

vim.scrolloff = 8
vim.signcolumn = "yes"
vim.isfname:append("@-@")

vim.updatetime = 50
-- Ignore case in search patterns
-- vim.ic = true
-- vim.smartcase = true

-- Set completeopt to have a better completion experience
vim.completeopt = "menuone,noselect"

vim.timeout = true
vim.timeoutlen = 300
-- Makes the line at the middle appear
-- vim.colorcolumn = "80"