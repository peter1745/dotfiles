local M = {}

function M.switch()
    -- 
    local old_edit = vim.cmd.edit
    vim.cmd.edit = function(filepath)
        local open_windows = vim.api.nvim_list_wins()
        local found_existing = false

        for _, win in ipairs(open_windows) do
            local win_buf = vim.api.nvim_win_get_buf(win)
            local fp = vim.api.nvim_buf_get_name(win_buf)
            local absolute_fp = vim.fn.fnamemodify(fp, ":p")

            if absolute_fp == filepath then
                vim.api.nvim_set_current_win(win)
                found_existing = true
                break
            end
        end

        vim.cmd.edit = old_edit

        if not found_existing then
            vim.cmd("vsplit | edit " .. filepath)
        end
    end
    vim.cmd([[ LspClangdSwitchSourceHeader]])
end

return M
