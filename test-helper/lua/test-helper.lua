local M = {}

M.setup = function()
	local function is_test_file()
		local f = vim.api.nvim_buf_get_name(0)
		-- match foo.test.js, foo.spec.tsx, etc.
		return f:match("%.test%.[^/]+$") or f:match("%.spec%.[^/]+$") or f:match("%.integration%.[^/]+$")
	end

	local function replace_only_and_check(input_string)
		-- Use string.gsub to replace ".only" with an empty string
		-- The % escaping the . to ensure it matches the literal dot
		-- string.gsub returns the new string AND the number of substitutions made
		local new_string, num_substitutions = string.gsub(input_string, "%.only", "")

		-- Check if the number of substitutions is greater than 0
		local replacement_occurred = num_substitutions > 0

		return new_string, replacement_occurred
	end

	local function add_only_to_describe_or_it(line)
		local newline, n = string.gsub(line, "(describe)%(%s*", "describe.only(")

		if n == 0 then
			newline, n = string.gsub(line, "(it)%(%s*", "it.only(")
		end

		if n == 0 then
			newline, n = string.gsub(line, "(test)%(%s*", "test.only(")
		end

		return newline, n > 0
	end

	local function toggle_only()
		if not is_test_file() then
			return
		end

		local bufnr = 0
		local row = vim.api.nvim_win_get_cursor(0)[1] - 1
		local line = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1]

		local new_line, has_changed = replace_only_and_check(line)

		if not has_changed then
			new_line, has_changed = add_only_to_describe_or_it(line)
		end

		-- If we changed anything, write it back
		if has_changed then
			vim.api.nvim_set_current_line(new_line)
		end
	end

	local function remove_all_only()
		if not is_test_file() then
			return
		end

		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

		-- Join all lines into a single string
		local text = table.concat(lines, "\n")

		local new_line, has_changed = replace_only_and_check(text)

		if has_changed then
			-- Split text back into lines
			local new_lines = vim.split(new_line, "\n", { plain = true })

			-- Replace buffer content with new lines
			vim.api.nvim_buf_set_lines(0, 0, -1, false, new_lines)
		end
	end

	vim.keymap.set(
		"n",
		"<leader>tt",
		toggle_only,
		{ desc = "Toggle .only on describe()/it()/test()", noremap = true, silent = false }
	)

	vim.keymap.set("n", "<leader>tr", remove_all_only, { desc = "Remove all .only", noremap = true, silent = false })
end
--
return M
