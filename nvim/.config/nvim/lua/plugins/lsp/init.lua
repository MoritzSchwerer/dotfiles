return {
    {
        'neovim/nvim-lspconfig',
        event = "BufReadPre",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/nvim-cmp',

            { "folke/neoconf.nvim",      cmd = "Neoconf", config = true },
            { "folke/neodev.nvim",       config = true },
            { "j-hui/fidget.nvim",       config = true },
            { "smjonas/inc-rename.nvim", config = true },

            -- Language servers
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
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        ensure_installed = {
            "blue",
        },
        config = function(plugin)
            require("mason").setup()
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
                    nls.builtins.formatting.blue,
                },
            }
        end,
    },
}
