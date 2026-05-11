vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.g.markdown_recommended_style = 0

-- Search and Highlight
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- UI
vim.o.winborder = "rounded"
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"
vim.opt.fillchars = { eob = " " }
vim.opt.laststatus = 3
vim.opt.showmode = false

-- Completion
vim.opt.completeopt = { "menuone", "noselect", "popup" }

-- Behavior
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.iskeyword:append "-"
vim.opt.foldlevel = 999
vim.opt.foldlevelstart = 999
vim.opt.wrap = false
vim.opt.scrolloff = 8

-- Providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

if not vim.env.SSH_TTY then
    vim.opt.clipboard = "unnamedplus"
end
