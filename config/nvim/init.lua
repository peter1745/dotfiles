require("config.lazy")
require("config.options")
require("config.keybinds")
require("nvim-treesitter").install({ "c" })

-- Disables auto-insertion when any letter is typed (stupid..)
vim.cmd[[set completeopt+=menuone,noselect,popup]]

local autocmd_group = vim.api.nvim_create_augroup("my.lsp", {})

-- Controls how quickly the function signature popup appears (will probably affect other things too)
vim.opt.updatetime = 250

-- Automatically show signature help when you pause over a function for long enough
vim.api.nvim_create_autocmd("CursorHold", {
    group = autocmd_group,
    callback = function(args)
        vim.lsp.buf.signature_help({
            silent = true,
            max_width  = 80,
            max_height = 5,
            focusable = false
        })
    end
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = autocmd_group,
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        local bufmap = function(mode, rhs, lhs)
            vim.keymap.set(mode, rhs, lhs, { buffer = args.buf })
        end

        bufmap("n", "<C-k>", function()
            vim.lsp.buf.signature_help()
        end)

        -- TODO: Figure out what this is for
        if client:supports_method("textDocument/implementation") then
          -- Create a keymap for vim.lsp.buf.implementation ...
        end

        -- Auto completion
        if client:supports_method("textDocument/completion") then
            local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, args.buf, {
                autotrigger = true,
                convert = function(item)
                    return { abbr = item.label:gsub("%b()", "") }
                end
            })
        end
    end
})

vim.lsp.config("clangd", {
    filetypes = { "c", "h", "cpp", "hpp" }
})

vim.lsp.enable("clangd")

