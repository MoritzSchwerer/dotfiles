return {
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
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true,
	},
	{
		'HiPhish/rainbow-delimiters.nvim',
		event = "BufReadPost",
	},
}
