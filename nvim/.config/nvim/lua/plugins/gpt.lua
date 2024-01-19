return {
    {
        "jackMort/ChatGPT.nvim",
        keys = {
            { "<leader>nc", "<cmd>ChatGPT<cr>",                     desc = "Open chat popup" },
            { "<leader>na", "<cmd>ChatGPTActAs<cr>",                desc = "Open chat with different actors" },
            { "<leader>ne", "<cmd>ChatGPTEditWithInstructions<cr>", mode = { "n", "v" },                     desc = "Open popup to edit selected text" },
            { "<leader>no", "<cmd>ChatGPTRun optimize_code<cr>",    mode = { "n", "v" },                     desc = "Optimize selected code" },
        },
        config = function()
            require("chatgpt").setup()
        end,
        dependencies = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
        },
    },
}
