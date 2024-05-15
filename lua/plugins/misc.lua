vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.ts", "*.lua" },
	callback = function(ev)
		print(string.format("event fired: s", vim.inspect(ev)))
	end,
})
