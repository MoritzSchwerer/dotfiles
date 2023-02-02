local config_cmp = function(lsp)
    local cmp = require('cmp')
    local cmp_select = {behavior = cmp.SelectBehavior.Select}
    local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<C-f>'] = cmp.mapping(function(fallback)
            if require('luasnip').jumpable(1) then
                require('luasnip').jump(1)
            else
                fallback()
            end
        end, {'i', 's'}),
    })
    lsp.setup_nvim_cmp({
        mapping = cmp_mappings,
        completion = {
            completeopt = 'menu,menuone, noinsert, noselect',
        },
        sources = {
            { name = 'copilot' },
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer', keyword_length = 3 },
            { name = 'path' },
        },
        documentation = {
            border = 'rounded',
            col_offset = 0,
            side_padding = 1,
            winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
            zindex = 1001
        },
    })
end

return {
    -- {
    --     'zbirenbaum/copilot-cmp',
    --     dependencies = {
    --         'zbirenbaum/copilot.lua'
    --     },
    --     opts = {
    --         suggestions = { enabled = false },
    --         panel = { enabled = false },
    --     }
    -- },
    {
        'hrsh7th/cmp-copilot',
        dependencies = {
            'github/copilot.vim'
        },
    },
    -- {
    --     'zbirenbaum/copilot.lua',
    --     cmd = "Copilot",
    --     config = true,
    -- },
    {
        'VonHeikemen/lsp-zero.nvim',
        lazy = true,
        event = "BufReadPre",
        branch = 'v1.x',
        dependencies = {
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
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
            local lsp = require('lsp-zero')
            lsp.preset("recommended")
            lsp.ensure_installed({
                'sumneko_lua'
            })
            lsp.setup_servers({'pyright'})
            config_cmp(lsp)
            lsp.set_preferences({
                sign_icons = {},
                suggest_lsp_servers = false,
            })
            lsp.on_attach(function(client, bufnr)
                local opts = {buffer = bufnr, remap = false}

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end)
            lsp.setup()
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = true,
                underline = true,
            })
        end,
    }
}
