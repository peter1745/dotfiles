return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				highlight = { enabled = true },
				indent = { enabled = true },
				ensure_installed = { "c", "lua" },
				auto_install = true
			})
		end
	},
    {
        "neovim/nvim-lspconfig",
        config = function()
        end
    },
    {
        "MarcWeber/vim-addon-local-vimrc",
        config = function()
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },
}
