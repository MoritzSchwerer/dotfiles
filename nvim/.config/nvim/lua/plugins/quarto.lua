return {
    { 'quarto-dev/quarto-nvim',
        dependencies = {
            'jmbuhr/otter.nvim',
            'neovim/nvim-lspconfig'
        },
        event = "VeryLazy",
        config = function()
            require('quarto').setup {
                lspFeatures = {
                    enabled = true,
                    languages = { 'python' },
                    diagnostics = {
                        enabled = true,
                        triggers = { "BufWrite" }
                    },
                    completion = {
                        enabled = true
                    }
                }
            }
        end
    },
    {
        'jpalardy/vim-slime',
        event = 'VeryLazy'
    },
    {
        'ekickx/clipboard-image.nvim',
        event = 'VeryLazy'
    },
    {
        "akinsho/toggleterm.nvim",
        version = '*',
        event = "VeryLazy",
        config = function()
            require("toggleterm").setup {
                open_mapping = [[<c-\>]],
                direction = 'float',
            }
        end
    }
}
