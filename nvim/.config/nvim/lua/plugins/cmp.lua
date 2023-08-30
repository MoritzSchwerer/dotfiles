return {
    {
        'hrsh7th/nvim-cmp',
        -- event = "InsertEnter",
        ft = { 'python', 'bash' },
        keys = {
            {
                "<leader>to",
                function()
                    require('cmp').setup.buffer { enabled = false }
                end,
                desc = "Turn off cmp"
            },
            {
                "<leader>ta",
                function()
                    require('cmp').setup.buffer { enabled = true }
                end,
                desc = "Turn on cmp"
            },
        },
        dependencies = {
            { 'neovim/nvim-lspconfig' },

            -- Autocompletion
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-copilot' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },


            -- Snippets
            {
                'L3MON4D3/LuaSnip',
                config = function()
                    require('luasnip').config.set_config {
                        history = true,
                        updateevents = 'TextChanged,TextChangedI',
                    }
                end
            },
            { 'rafamadriz/friendly-snippets' },
        },
        config = function()
            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local icons = require "config.icons"
            cmp.setup {
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
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
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'luasnip',                keyword_length = 3 },
                    { name = 'buffer',                 keyword_length = 3 },
                    { name = 'path' },
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, item)
                        local max_width = 0
                        local source_names = {
                            nvim_lsp = "(LSP)",
                            path = "(Path)",
                            luasnip = "(Snippet)",
                            buffer = "(Buffer)",
                        }
                        local duplicates = {
                            buffer = 1,
                            path = 1,
                            nvim_lsp = 0,
                            luasnip = 1,
                        }
                        local duplicates_default = 0
                        if max_width ~= 0 and #item.abbr > max_width then
                            item.abbr = string.sub(item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
                        end
                        item.kind = icons.kind[item.kind]
                        item.menu = source_names[entry.source.name]
                        item.dup = duplicates[entry.source.name] or duplicates_default
                        return item
                    end,
                },
            }
        end,
    },
    {
        'hrsh7th/cmp-copilot',
        dependencies = {
            {
                'github/copilot.vim',
            }
        },
    },
    {
        'github/copilot.vim',
        config = function()
            vim.g.copilot_filetypes = {
                markdown = false,
                rust = false,
            }
        end,
    }
}
