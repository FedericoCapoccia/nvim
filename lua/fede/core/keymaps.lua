local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.autoformat = true

map("n", "<leader>l", "<cmd>noh<CR>", { noremap = true, silent = true, desc = "Clear highlight" })
map("n", "<leader>i", "gg=G<CR>", { noremap = true, silent = true, desc = "Indent file" })
map("n", "<leader>ww", "<cmd> w<CR>", { noremap = true, silent = true, desc = "Save file" })
map("n", "<leader>wa", "<cmd> wa<CR>", { noremap = true, silent = true, desc = "Save all files" })
map("n", "<leader>qq", "<cmd> q!<CR>", { noremap = true, silent = true, desc = "Quit file" })
map("n", "<leader>qa", "<cmd> qa!<CR>", { noremap = true, silent = true, desc = "Quit all files" })
map("n", "<Tab>", "<cmd> bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd> bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
map("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent from visual" })
map("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent from visual" })
map("v", "p", '"_dP', { noremap = true, silent = true, desc = "" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

