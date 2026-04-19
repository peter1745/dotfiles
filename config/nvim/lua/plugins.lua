return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {}
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
		  lsp_styles = {
			underlines = {
			  errors = { "undercurl" },
			  hints = { "undercurl" },
			  warnings = { "undercurl" },
			  information = { "undercurl" },
			},
		  },
		  integrations = {
			aerial = true,
			alpha = true,
			cmp = true,
			dashboard = true,
			flash = true,
			fzf = true,
			grug_far = true,
			gitsigns = true,
			headlines = true,
			illuminate = true,
			indent_blankline = { enabled = true },
			leap = true,
			lsp_trouble = true,
			mason = true,
			mini = true,
			navic = { enabled = true, custom_bg = "lualine" },
			neotest = true,
			neotree = true,
			noice = true,
			notify = true,
			snacks = true,
			telescope = true,
			treesitter_context = true,
			which_key = true,
		  },
		}
    },
    {
       "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                highlight = {
					enabled = true,
					additional_vim_regex_highlighting = {}
				},
                indent = { enabled = true },
                ensure_installed = { "c", "cpp", "lua", "ebnf", "rust" },
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
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- optional but recommended
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        }
    },
    {
        "RubixDev/ebnf",
        rtp = "crates/tree-sitter-ebnf"
    }
}
