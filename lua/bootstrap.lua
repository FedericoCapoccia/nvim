-----------------------------------------------------------------------------
---  _                      ____              _       _
--- | |    __ _ _____   _  | __ )  ___   ___ | |_ ___| |_ _ __ __ _ _ __
--- | |   / _` |_  / | | | |  _ \ / _ \ / _ \| __/ __| __| '__/ _` | '_ \
--- | |__| (_| |/ /| |_| | | |_) | (_) | (_) | |_\__ \ |_| | | (_| | |_) |
--- |_____\__,_/___|\__, | |____/ \___/ \___/ \__|___/\__|_|  \__,_| .__/
---                 |___/                                          |_|
--- By EzBl4ck
-----------------------------------------------------------------------------

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

require("lazy").setup("plugins")
vim.cmd 'colorscheme onedark'
