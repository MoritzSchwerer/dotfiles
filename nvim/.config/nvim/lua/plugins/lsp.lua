local on_attach = function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "fa", function() vim.lsp.buf.format() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

return {
    {
        'neovim/nvim-lspconfig',
        event = "BufReadPre",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/nvim-cmp',

            -- Language servers
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Added linting and formating
            "jose-elias-alvarez/null-ls.nvim",
            "jay-babu/mason-null-ls.nvim",
        },
        config = function()
            local servers = {
                'pyright',
                'sumneko_lua',
                'bashls',
            }
            require("mason").setup()
            require("mason-lspconfig").setup {
                ensure_installed = servers
            }
            for _, server in ipairs(servers) do
                require('lspconfig')[server].setup({
                    on_attach = on_attach,
                    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
                })
            end

            -- make lua lsp aware of vim global
            require('lspconfig').sumneko_lua.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'},
                        },
                    },
                },
            }
	        require("mason-null-ls").setup {
                ensure_installed = {
                    "autoflake",
                    "blue",
                }
            }
            local null_ls = require("null-ls")
            null_ls.setup {
                sources = {
                    null_ls.builtins.formatting.blue,
                    null_ls.builtins.diagnostics.flake8,
                },
            }
        end,
    },
}
