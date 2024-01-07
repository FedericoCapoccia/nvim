-----------------------------------------
---   ___        _   _
---  / _ \ _ __ | |_(_) ___  _ __  ___
--- | | | | '_ \| __| |/ _ \| '_ \/ __|
--- | |_| | |_) | |_| | (_) | | | \__ \
---  \___/| .__/ \__|_|\___/|_| |_|___/
---       |_|
--- By EzBl4ck
-----------------------------------------

local options = {
  autoindent = true,
  backspace = "indent,eol,start",
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 1,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  expandtab = true,
  fileencoding = "utf-8",
  hidden = true,
  hlsearch = true,
  ignorecase = false,
  mouse = "a",
  number = true,
  numberwidth = 4,
  relativenumber = true,
  scrolloff = 8,
  shiftwidth = 2,
  showtabline = 2,
  sidescrolloff = 8,
  signcolumn = "yes",
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  undofile = true,
  updatetime = 300,
  wrap = false,
  writebackup = false,
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.opt.shortmess:append("c")
vim.cmd([[set iskeyword+=-]])
