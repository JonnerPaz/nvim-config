-- Makes cursor big when typing
vim.opt.guicursor = ""

-- Numbers and relative numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Lines won't wrap when splitting windows
vim.opt.wrap = false

-- Get rid of swap file and backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search text options
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
-- Ignore case in search patterns
-- vim.opt.ic = true
-- vim.opt.smartcase = true

-- Makes the line at the middle appear
vim.opt.colorcolumn = "80"

