return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.cmd [[
        filetype plugin indent on
        syntax enable
      ]]
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        executable = "latexmk",
        options = {"-pdf", "-interaction=nonstopmode", "-synctex=1", "-file-line-error"},
      }
    end,
  },
}
