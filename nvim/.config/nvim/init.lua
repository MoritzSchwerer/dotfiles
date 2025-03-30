local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


require('lazy').setup('plugins', {
    defaults = { lazy = true }
})
require('config')

-----------------------------------
-------------- Macros -------------

-- @l will print out the value of the highlighted variable
vim.api.nvim_create_augroup("LoggingMacro", { clear = true })
local log_commands = {
    python = "yoprint('pa €kb: ', pa)",
    cpp = "yostd::cout << 'pa €kb:' << pa << std::endl;",
}
vim.api.nvim_create_autocmd("FileType", {
    group = "LoggingMacro",
    pattern = vim.tbl_keys(log_commands),
    callback = function(args)
        local command = log_commands[args.match]
        if command then
            vim.fn.setreg("l", command)
        end
    end
})
