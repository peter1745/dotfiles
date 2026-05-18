return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "lua"
            },
            highlight = {
                enabled = true,
                additional_vim_regex_highlighting = {}
            },
            indent = { enabled = true },
            auto_install = true
        }
    }
}
