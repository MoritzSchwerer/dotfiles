return {
    {
        'numToStr/Comment.nvim',
        keys = {
            { "co" },
        },
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
            { "<leader>u", "<cmd>UndotreeToggle<cr>" },
        },
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
    }
}
