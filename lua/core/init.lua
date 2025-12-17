-- Config for vanilla nvim
require("core.set")
require("core.remap")

-- Bootstrap Lazy.nvim
require("core.lazy")
require("core.lsp_settings")
require("core.statusline")

vim.cmd.colorscheme("moonfly")
