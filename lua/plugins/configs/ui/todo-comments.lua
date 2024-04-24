--[[ 
    FIX 
    TODO
    HACK 
    WARN
    PERF 
    NOTE
    TEST 
    ]]

vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", { desc = "Todo with Telescope" })

vim.keymap.set("n", "<leader>t]", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "<leader>t[", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
