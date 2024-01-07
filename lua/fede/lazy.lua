-------------------------------
---  _                    
--- | |    __ _ _____   _ 
--- | |   / _` |_  / | | |
--- | |__| (_| |/ /| |_| |
--- |_____\__,_/___|\__, |
---                 |___/ 
--- By EzBl4ck
-------------------------------

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

require("lazy").setup({
  { import = "fede.plugins" },
  { import = "fede.plugins.colorschemes" },
},{})

vim.cmd [[colorscheme onedark]]
