This dir is for vim.lsp.config (Neovim 0.11+) configurations.
Most servers are configured automatically via nvim-lspconfig defaults + mason.
Create a file named after the server (e.g. tailwindcss.lua) and return a table
with settings, filetypes, cmd, etc. It is merged and enabled via vim.lsp.enable().
See :help lspconfig-nvim-0.11 and :help vim.lsp.config.
