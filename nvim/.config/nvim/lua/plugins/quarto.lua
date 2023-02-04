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
        cmd = { "SlimeConfig", "SlimeSend", "SlimeSendCurrentLine" },
        keys = {
            { "<s-cr>", "<cmd>SlimeSendCurrentLine<cr>" },
            { "<s-cr>", "<cmd>SlimeSend<cr>" },
        },
        config = function()
            vim.g.slime_target = "tmux"
            vim.g.slime_default_config = {
                socket_name = "default",
                target_pane = "{last}"
            }
        end
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
