local M = {}

local servers = {
    ruff = {
        settings = {}
    },
    basedpyright = {
        settings = {
            basedpyright = {
                typeCheckingMode = "off",
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
    texlab = {
        build = {
            executable = "latexmk",
            args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "-file-line-error" },
            onSave = true,
        },
        forwardSearch = {
            executable = "zathura",
            args = { "--synctex-forward", "%l:1:%f", "%p" },
        },
    }
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
        automatic_enable = false,
        ensure_installed = vim.tbl_keys(servers),
    }

    local configured = {}
    for name, opts in pairs(servers) do
        opts = opts or {}
        opts.capabilities = opts.capabilities or lsp_capabilities()
        vim.lsp.config(name, opts)
        table.insert(configured, name)
    end
    vim.lsp.enable(configured)
end

return M
