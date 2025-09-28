return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{
			"tpope/vim-dadbod",
			lazy = true,
		},
		{
			"kristijanhusak/vim-dadbod-completion",
			ft = { "sql", "mysql", "plsql" },
			lazy = true,
		},
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.dbs = {
			wsl_pg = "postgres://postgres@10.255.255.254:5432/analysis",
		}
		-- vim.g.db_ui_auto_execute_table_helpers = 1 -- execute on save
	end,
}
