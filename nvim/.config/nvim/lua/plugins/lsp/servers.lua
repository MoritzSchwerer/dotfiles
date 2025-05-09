local M = {}

local servers = {
    basedpyright = {
        settings = {
            basedpyright = {
                typeCheckingMode = "standard",
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
    rust_analyzer = {
        settings = {
            diagnostics = {
                enable = true,
            },
            checkOnSave = {
                command = "clippy",
            },
        },
    },
    clangd = {
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
        },

    },
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
    return require("blink.cmp").get_lsp_capabilities(capabilities)
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
            if opts.capabilities == nil then
                opts.capabilities = lsp_capabilities()
            end
            require("lspconfig")[server].setup(opts)
        end,
    }
end

return M
