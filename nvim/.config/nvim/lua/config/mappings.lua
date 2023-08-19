local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-a>h", "<C-w>h", opts)
keymap("n", "<C-a>j", "<C-w>j", opts)
keymap("n", "<C-a>k", "<C-w>k", opts)
keymap("n", "<C-a>l", "<C-w>l", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Turn of highlights
keymap("n", "<leader>hl", "<cmd>nohlsearch<cr>", opts)


-- Launch panel if nothing is typed after <leader>z
keymap("n", "<leader>zz", "<cmd>Telekasten panel<CR>", opts)
-- Most used functions
keymap("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>", opts)
keymap("n", "<leader>zd", "<cmd>Telekasten find_daily_notes<CR>", opts)
keymap("n", "<leader>zs", "<cmd>Telekasten search_notes<CR>", opts)
keymap("n", "<leader>zt", "<cmd>Telekasten goto_today<CR>", opts)
keymap("n", "<leader>zg", "<cmd>Telekasten follow_link<CR>", opts)
keymap("n", "<leader>zn", "<cmd>Telekasten new_note<CR>", opts)
keymap("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>", opts)
keymap("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>", opts)
keymap("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>", opts)
-- Push changes to git
keymap("n", "<leader>zp",
    "<cmd>silent execute '!(cd $ZETTELKASTEN_ROOT && committer -b &) > /dev/null' | lua require('notify')('Notes Commited')<cr>",
    opts)
-- Pull from git
keymap("n", "<leader>zu",
    "<cmd>silent execute '!(cd $ZETTELKASTEN_ROOT && committer -s &) > /dev/null' | lua require('notify')('Syncing Changes...')<cr>",
    opts)



-- Call insert link automatically when we start typing a link
-- keymap("i", '[[', "<cmd>Telekasten insert_link<CR>", opts)
