return {
    {
        'numToStr/Comment.nvim',
        event = "VeryLazy",
        opts = {
            toggler = {
                line = 'co',
            },
            opleader = {
                line = 'co',
            },
        },
        config = true,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = "VeryLazy",
        opts = {
            char = '┊',
            show_trailing_blankline_indent = false,
        }
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
    },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        opts = { use_diagnostic_signs = true },
        dependencies = {
            "kyazdani42/nvim-web-devicons",
        },
        keys = {
            { "<leader>dt", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
            { "<leader>wt", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        },
    },
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        config = true,
        keys = {
            { "<leader>st", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
        },
    },
}
