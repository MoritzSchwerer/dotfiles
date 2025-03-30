local M = {}

function M.insert_print_for_visual_selection()
    -- Get visual selection range (1-based line/col)
    -- See :help getpos()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    -- Check if the visual selection marks are valid
    -- getpos returns [bufnum, lnum, col, off] - we check lnum (index 2)
    if start_pos[2] == 0 or end_pos[2] == 0 then
        vim.notify("Error: No visual selection detected.", vim.log.levels.ERROR)
        return
    end

    -- Convert to 0-based line/col for nvim API functions
    local start_line = start_pos[2] - 1
    local start_col = start_pos[3] - 1
    local end_line = end_pos[2] - 1
    -- nvim_buf_get_text's end_col is exclusive, getpos's col is inclusive.
    -- For single character selection, start_col == end_col from getpos,
    -- so we need end_col for get_text to be start_col + 1.
    -- For multi-character, getpos's end_col points to the last character.
    -- nvim_buf_get_text expects the column *after* the last character.
    local end_col = end_pos[3] -- getpos gives inclusive column, API needs exclusive end

    -- Get the currently selected text
    -- Args: buffer (0=current), start_line, start_col, end_line, end_col, opts {}
    local selected_lines = vim.api.nvim_buf_get_text(0, start_line, start_col, end_line, end_col, {})
    -- selected_lines is a table of strings (lines). Join them.
    local selected_text = vim.trim(table.concat(selected_lines, "")) -- Trim whitespace

    -- Check if selected text is empty
    if selected_text == "" then
        vim.notify("Error: Visual selection is empty.", vim.log.levels.ERROR)
        return
    end

    -- Determine indentation based on the line where the visual selection ends
    local indent_str = ""
    -- Get the content of the line where the selection ended
    local end_line_content = vim.api.nvim_buf_get_lines(0, end_line, end_line + 1, false)[1]
    if end_line_content then
        -- Extract leading whitespace (spaces or tabs)
        indent_str = end_line_content:match("^[ \t]*") or ""
    end

    local print_statement = string.format('%sprint("%s: ", %s)', indent_str, selected_text, selected_text)

    -- Calculate the line number to insert the print statement (0-based)
    -- This will be the line *after* the line where the selection ended.
    local insert_line_num = end_line + 1

    -- Insert the print statement into the buffer
    -- Args: buffer (0=current), start_line, end_line, strict_indexing (false), replacement (table of lines)
    vim.api.nvim_buf_set_lines(0, insert_line_num, insert_line_num, false, { print_statement })
end

return M
