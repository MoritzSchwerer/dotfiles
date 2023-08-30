return {
    {
        'hrsh7th/nvim-cmp',
        event = "VeryLazy",
        dependencies = {
            'neovim/nvim-lspconfig',
            -- sources
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',

            -- snips
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local cmp = require('cmp')
            local cmp_select = { behaviour = cmp.SelectBehavior.Select }
            local icons = require("config.icons")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
        	    window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-y>"] = cmp.mapping.confirm({select = true}),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp'},
                    { name = 'buffer', keyword_length = 3},
                    { name = 'path'},
                    { name = 'luasnip'},
                }),
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
            })
        end
    },
}
