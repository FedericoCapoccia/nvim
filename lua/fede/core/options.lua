local options = {
  autoindent = true,
  backspace = "indent,eol,start",
  backup = false,
  cmdheight = 0,
  completeopt = { "menu", "menuone", "noselect" },
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

if not vim.env.SSH_TTY then
  vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
end

vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })

for option, value in pairs(options) do
  vim.opt[option] = value
end

vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.markdown_recommended_style = 0

vim.cmd([[set iskeyword+=-]])
