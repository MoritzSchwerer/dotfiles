return {
    {
        'navarasu/onedark.nvim',
        opts = {
            code_style = {
                comments = 'italic',
                keywords = 'none',
                functions = 'none',
                strings = 'none',
                variables = 'none'
            },

        },

    },
    {
        'nvim-treesitter/nvim-treesitter',
        version = false,
        build = ":TSUpdate",
        event = "BufReadPost",
        dependencies = {
            "tree-sitter/tree-sitter-html"
        },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            rainbow = { enable = true },
            ensure_installed = {
                "cpp",
                "python",
                "javascript",
                "markdown",
                "bash",
                "lua",
                "haskell",
                "rust",
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        'p00f/nvim-ts-rainbow',
        event = "BufReadPost",
        dependencies = { 'nvim-treesitter' },
    },
    -- {
    --     'nvim-treesitter/nvim-treesitter-context',
    --     event = "BufReadPost",
    --     dependencies = { 'nvim-treesitter' },
    -- },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        event = "BufReadPost"
    }
}
