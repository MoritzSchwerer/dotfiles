local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Telescope
keymap('n', '<leader>af', "<cmd>Telescope find_files<cr>", opts)
keymap('n', '<leader>ag', "<cmd>Telescope live_grep<cr>", opts)
keymap('n', '<leader>ab', "<cmd>Telescope buffers<cr>", opts)
keymap('n', '<leader>ah', "<cmd>Telescope help_tags<cr>", opts)
