local options = {
    colorcolumn = "80",
    splitright = true,
    splitbelow = true,
    guicursor = "",
    number = true,
    relativenumber = true,

    smartindent = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    wrap = false,

    updatetime = 50,
    swapfile = false,
    backup = false,
    undofile = true,

    hlsearch = false,
    incsearch = true,

    termguicolors = true,
    scrolloff = 8,
    signcolumn = "yes",
}

if not vim.env.SSH_TTY then
    vim.opt.clipboard = "unnamedplus"
end

for option, value in pairs(options) do
    vim.opt[option] = value
end

vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.markdown_recommended_style = 0
vim.g.have_nerd_font = true
