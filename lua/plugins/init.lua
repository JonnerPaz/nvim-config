local lsp = require("plugins.lsp")
local ui = require("plugins.ui")
local tools = require("plugins.tools")
local themes = require("plugins.themes")

local plugins = { lsp, ui, tools, themes }

require("lazy").setup(plugins)

vim.cmd.colorscheme("onedark")
