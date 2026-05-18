local function find_files_edit(bufnr)
    local action_state = require("telescope.actions.state")
    local entry = action_state.get_selected_entry()
    require("telescope.actions").close(bufnr)

    local target_buf = vim.fn.bufnr(entry[1])
    if target_buf ~= -1 then
        local win_ids = vim.fn.win_findbuf(target_buf)
        if #win_ids > 0 then
            -- Open in existing window
            vim.fn.win_gotoid(win_ids[1])
            return
        end
    end

    -- Open in new tab
    vim.cmd("tabedit " .. vim.fn.fnameescape(entry[1]))
end

return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
        opts = {
            pickers = {
                find_files = {
                    mappings = { i = {
                        ["<CR>"] = find_files_edit
                    },
                    hidden = true
                }},
                man_pages = { mappings = { i = {
                    ["<CR>"] = "select_vertical"
                }}}
            }
        },
        config = function()
            require("telescope").load_extension("fzf")
        end
    }
}
