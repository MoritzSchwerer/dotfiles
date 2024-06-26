function SetTrans(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
end

function SetColor(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)
end

SetTrans()
