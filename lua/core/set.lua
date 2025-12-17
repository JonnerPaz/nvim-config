vim.g.snippets = "luasnip"

local set = vim.o
-- Makes cursor big when typing
set.guicursor = ""
set.winborder = "rounded"

vim.o.cmdheight = 0
vim.o.cmdwinheight = 1

-- Numbers and relative numbers
set.number = true
set.relativenumber = true

-- Indentation
set.tabstop = 4
vim.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true
set.autoindent = true

-- Lines won't wrap when splitting windows
set.wrap = false

-- Get rid of swap file and backups
set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true
set.backupcopy = "yes"

-- Search text options
set.hlsearch = false
set.incsearch = true
set.inccommand = "split"
set.smartcase = true -- case matters if using capital at start
set.ignorecase = true

-- set.cursorline = true

set.termguicolors = true

set.scrolloff = 8
set.signcolumn = "yes"

set.updatetime = 50

-- Set completeopt to have a better completion experience
-- set.completeopt = "menuone,noselect"

set.timeout = true
set.timeoutlen = 300
-- Makes the line at the middle appear
set.colorcolumn = "80"
set.splitbelow = true
set.splitright = true
set.laststatus = 3
set.cmdheight = 1

-- clipboard
set.clipboard = "unnamedplus"
-- set.clipboard:append("unnamedplus")

-- folding
--[[ vim.foldmethod = "indent"
vim.foldcolumn = "1"
vim.foldlevel = 99
vim.foldlevelstart = 99
vim.foldenable = true ]]
