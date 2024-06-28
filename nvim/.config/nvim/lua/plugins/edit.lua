return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
    },
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
        'mbbill/undotree',
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
        },
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
        cmd = "Trouble",
        keys = {
            { '<leader>wt', "<cmd>Trouble diagnostics toggle focus=true<cr>",              desc = "Trouble toggle workspace diagnostics" },
            { '<leader>dt', "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>", desc = "Trouble toggle document diagnostics" },
            { '<leader>td', "<cmd>TodoTrouble toggle focus=true<cr>",                      desc = "Trouble toggle document diagnostics" },
        }
    }
}
