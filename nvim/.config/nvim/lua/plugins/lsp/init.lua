return {
    {
        'neovim/nvim-lspconfig',
        event = "BufReadPost",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Added linting and formating
            "jose-elias-alvarez/null-ls.nvim",
            "jay-babu/mason-null-ls.nvim",
        },
        config = function()
            require("plugins.lsp.servers").setup()
        end,
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        ensure_installed = {
            "ruff",
            -- "mypy",
        },
        config = function(plugin)
            require("mason").setup(
                {
                    PATH = "append"
                }
            )
            local mr = require "mason-registry"
            for _, tool in ipairs(plugin.ensure_installed) do
                local p = mr.get_package(tool)
                if not p:is_installed() then
                    p:install()
                end
            end
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        event = "BufReadPost",
        dependencies = { "mason.nvim" },
        config = function()
            local nls = require "null-ls"
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            nls.setup {
                sources = {
                    -- nls.builtins.formatting.clang_format,
                    nls.builtins.formatting.ruff,
                    -- nls.builtins.diagnostics.mypy,
                    nls.builtins.diagnostics.ruff.with({
                        method = nls.methods.DIAGNOSTICS_ON_SAVE,
                    }),
                    -- nls.builtins.diagnostics.mypy.with({
                    --     extra_args = function()
                    --         local virtual = os.getenv("CONDA_PREFIX") or "/usr"
                    --         return { "--python-executable", virtual .. "/bin/python" }
                    --     end,
                    -- }),
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({
                            group = augroup,
                            buffer = bufnr,
                        })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end,
            }
        end,
    },
}
