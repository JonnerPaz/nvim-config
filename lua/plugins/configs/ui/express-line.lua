return function()
	local extensions = require("el.extensions")
	local builtin = require("el.builtin")
	local subscribe = require("el.subscribe")
	local sections = require("el.sections")

	require("el").setup({
		generator = function()
			local segments = {}

			-- vim mode
			table.insert(segments, extensions.mode)
			table.insert(segments, " ")
			table.insert(segments, "-->")

			-- Git branch
			table.insert(
				segments,
				subscribe.buf_autocmd("el-git-branch", "BufEnter", function(win, buf)
					local branch = extensions.git_branch(win, buf)
					if branch then
						return "  " .. branch
					end
				end)
			)

			-- file icon
			table.insert(segments, " ")
			table.insert(
				segments,
				subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, buffer)
					return extensions.file_icon(_, buffer)
				end)
			)

			-- Git changes
			table.insert(
				segments,
				subscribe.buf_autocmd("el-git-changes", "BufWritePost", function(win, buf)
					local changes = extensions.git_changes(win, buf)
					if changes then
						return changes
					end
				end)
			)

			-- makes spaces equal so file path keeps centered
			table.insert(segments, sections.split)
			table.insert(segments, "%f")
			table.insert(segments, sections.split)

			-- Right side
			table.insert(segments, builtin.filetype)
			table.insert(segments, "[")
			table.insert(segments, builtin.line_with_width(1))
			table.insert(segments, ":")
			table.insert(segments, builtin.column_with_width(1))
			table.insert(segments, "]")

			table.insert(segments, extensions.mode)

			return segments
		end,
	})
end
