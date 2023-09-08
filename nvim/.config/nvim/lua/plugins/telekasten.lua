return {
    {
        'renerocksai/telekasten.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'rcarriga/nvim-notify',
        },
        lazy = true,
        cmd = "Telekasten",
        keys = {
            { '<leader>zz',  "<cmd>Telekasten<cr>",              desc = "Telekasten pane" },
            { '<leader>zn',  "<cmd>Telekasten new_note<cr>",     desc = "Telekasten create new note" },
            { '<leader>ztt', "<cmd>Telekasten toggle_todo<cr>",  desc = "Telekasten toggle todo status" },
            { '<leader>zf',  "<cmd>Telekasten find_notes<cr>",   desc = "Telekasten find notes" },
            { '<leader>zs',  "<cmd>Telekasten search_notes<cr>", desc = "Telekasten search in notes" },
            { '<leader>ztg', "<cmd>Telekasten goto_today<cr>",   desc = "Telekasten goto today" },
        },
        config = function()
            local home = vim.fn.expand("~/.telekasten/")
            local year = os.date("%Y")
            local month = os.date("%m")
            require('telekasten').setup({
                -- directories
                home = home .. 'zettelkasten',
                dailies = home .. 'daily/' .. year .. '/' .. month,
                templates = home .. 'templates',
                template_new_note = home .. 'templates/' .. "new_note.md",
                template_new_daily = home .. 'templates/' .. "new_daily.md",

                extension = '.md',
                auto_set_filetype = true,
                image_subdir = '../files',
                image_link_style = 'markdown',
                sort = 'filename',
                tag_notation = '#tag',

                -- telescope actions behavior
                close_after_yanking = false,
                insert_after_inserting = true,

                template_handling = 'smart',
            })
        end,
    },
    {
        'rcarriga/nvim-notify',
        config = function()
            local notify = require('notify')
            notify.setup({
                background_colour = '#000000',
            })
        end,
    }
}
