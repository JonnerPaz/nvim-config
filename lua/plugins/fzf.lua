return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			files = {
				fd_opts = [[--color=never --type f --follow --exclude node_modules --exclude .git]],
				rg_opts = "--files --hidden --glob '!**/node_modules/*' --glob '!**/.git/*'",
				file_ignore_pattern = { ".git/", "node_modules/" },
			},
		})
	end,
}
