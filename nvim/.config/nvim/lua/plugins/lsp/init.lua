return {
    {
        'neovim/nvim-lspconfig',
        event = "BufReadPre",
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
            "mypy",
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
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufReadPre",
        dependencies = { "mason.nvim" },
        config = function()
            local nls = require "null-ls"
            nls.setup {
                sources = {
                    nls.builtins.formatting.ruff,
                    nls.builtins.diagnostics.mypy,
                    nls.builtins.diagnostics.ruff.with({
                        method = nls.methods.DIAGNOSTICS_ON_SAVE,
                    }),
                },
            }
        end,
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
        cmd = "Trouble",
        keys = {
            { '<leader>wt', "<cmd>Trouble workspace_diagnostics<cr>", desc = "Trouble toggle workspace diagnostics" },
            { '<leader>dt', "<cmd>Trouble document_diagnostics<cr>",  desc = "Trouble toggle document diagnostics" },
        }
    }
}
