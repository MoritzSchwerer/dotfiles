local M = {}

local servers = {
    julials = {},
    hls = {
        settings = {
            haskell = {
                cabalFormattingProvider = "cabalfmt",
                formattingProvider = "stylish-haskell",
                maxCompletions = 10,
                plugin = {
                    hlintOn = {
                        globalOn = true
                    },
                },
            }
        }
    },
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' },
                },
            },
        },
    },
    pyright = {
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "strict",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true
                },
            },
        },
    },
    ruff_lsp = {},
}

local function lsp_attach(on_attach)
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local bufnr = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            on_attach(client, bufnr)
        end,
    })
end

local function lsp_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

function M.setup()
    lsp_attach(function(client, buffer)
        require("plugins.lsp.format").on_attach(client, buffer)
        require("plugins.lsp.keymaps").on_attach(client, buffer)
    end)

    require("mason-lspconfig").setup {
        ensure_installed = vim.tbl_keys(servers),
    }
    require("mason-lspconfig").setup_handlers {
        function(server)
            local opts = servers[server] or {}
            opts.capabilities = lsp_capabilities()
            require("lspconfig")[server].setup(opts)
        end,
    }
end

return M