return {
    {
        "catppuccin/nvim",
        version = "*",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "mocha",
            auto_integrations = true,
            lsp_styles = {
                underlines = {
                    errors = { "undercurl" },
                    hints = { "undercurl" },
                    warnings = { "undercurl" },
                    information = { "undercurl" },
                }
            }
        },
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end
    }
}
