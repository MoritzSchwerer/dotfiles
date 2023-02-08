return {
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            {'neovim/nvim-lspconfig'},

            -- Autocompletion
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'hrsh7th/cmp-copilot'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        },
        config = function()
            local cmp = require('cmp')
            local cmp_select = {behavior = cmp.SelectBehavior.Select}
            cmp.setup{
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-f>'] = cmp.mapping(function(fallback)
                        if require('luasnip').jumpable(1) then
                            require('luasnip').jump(1)
                        else
                            fallback()
                        end
                    end),
                }),
                sources = {
                    { name = 'copilot' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip', keyword_length = 3 },
                    { name = 'buffer', keyword_length = 3 },
                    { name = 'path' },
                },
            }
        end,
    },
    {
        'hrsh7th/cmp-copilot',
        dependencies = {
            'github/copilot.vim'
        },
    },
}
