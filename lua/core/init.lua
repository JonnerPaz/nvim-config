-- Set the package.path for plugins configuration
package.path = vim.fn.stdpath("config") .. "/lua/plugins/configs/?.lua;" .. package.path
package.path = vim.fn.stdpath("config") .. "/lua/plugins/configs/?/init.lua;" .. package.path

-- Bootstrap Lazy.nvim
require("core.lazy")

-- Config for vanilla nvim
require("core.set")
require("core.remap")

-- Initialize plugins
require("plugins")
