return {
	{
		'windwp/nvim-autopairs',
	    event = "InsertEnter",
		config = true,
	},
	{
		'numToStr/Comment.nvim',
		event = "VeryLazy",
		opts = {
			toggler = {
				line = 'co',
			},
			opleader = {
				line = 'co',
			},
		},
		config = true,
	},
    {
        'mbbill/undotree',
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc="Toggle Undutree" },
        },
    },
}
