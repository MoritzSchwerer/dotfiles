return {
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
            ensure_installed = {
                "python",
                "javascript",
                "markdown",
                "bash",
                "lua",
                "haskell"
            },
            rainbow = { enable = true },
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
    {
        'nvim-treesitter/nvim-treesitter-context',
        event = "BufReadPost",
        dependencies = { 'nvim-treesitter' },
    },


}
