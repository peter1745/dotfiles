
local M = {}

local function split_filename(file)
    local path, filename, extension = string.match(file, "(.-)([^\\/]-)([^\\/%.]+)$")

    -- pop the "." off the end of the filename - wouldn't need if my regex were better
    filename = filename:sub(1,-2)

    return path, filename, extension
end

function M.switch()
    local buf = vim.api.nvim_win_get_buf(0)
    local filepath = vim.api.nvim_buf_get_name(buf)
    local path, filename, ext = split_filename(filepath)
    local other_file = ""

    if ext == "c" then
        other_file = path .. filename .. ".h"
    elseif ext == "h" then
        other_file = path .. filename .. ".c"
    else
        return
    end

    local absolute_other = vim.fn.fnamemodify(other_file, ":p")
    local open_windows = vim.api.nvim_list_wins()

    for _, win in ipairs(open_windows) do
        local win_buf = vim.api.nvim_win_get_buf(win)
        local fp = vim.api.nvim_buf_get_name(win_buf)
        local absolute_fp = vim.fn.fnamemodify(fp, ":p")

        if absolute_fp == absolute_other then
            vim.api.nvim_set_current_win(win)
            return
        end
    end

    vim.cmd("vsplit | edit " .. other_file)
end

return M
