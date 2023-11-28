local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local map = vim.keymap

-- Global
map.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map.set("n", "<leader>i", "gg=G<CR>", opts)  -- indent
map.set("n", "<leader>ww", "<cmd> w<CR>", opts)  -- save file
map.set("n", "<leader>wa", "<cmd> wa<CR>", opts)  -- save all
map.set("n", "<leader>qq", "<cmd> q!<CR>", opts)  -- quit file
map.set("n", "<leader>qa", "<cmd> qa!<CR>", opts)  -- quit all
map.set("n", "<leader>h", "<cmd> split<CR><cmd> term<CR><cmd> set nornu<CR><cmd> set nu!<CR>i", opts)  -- horizontal term
map.set("n", "<C-Up>", "<cmd> resize +2<CR>", opts) -- resize split
map.set("n", "<C-Down", "<cmd> resize -2<CR>", opts) -- resize split
map.set("n", "<C-Left>", "<cmd> vertical resize -2<CR>", opts) -- resize split
map.set("n", "<C-Right>", "<cmd> vertical resize +2<CR>", opts) -- resize split
map.set("n", "<Tab>", "<cmd> bnext<CR>", opts) -- next buffer
map.set("n", "<S-Tab>", "<cmd> bprevious<CR>", opts) -- previous buffer
map.set("v", "<", "<gv", opts) -- stay in indent
map.set("v", ">", ">gv", opts) -- stay in indent
map.set("v", "p", '"_dP', opts)
map.set("n", "<leader>x", "<cmd> Bdelete<CR>", opts)

-- NvimTree
map.set("n", "<C-n>", "<cmd> NvimTreeToggle<CR>", opts) -- toggle nvimtree
map.set("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", opts) -- focus nvimtree
