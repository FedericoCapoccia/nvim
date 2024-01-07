-------------------------------------------------------------------------------
---   ____ _       _           _   __  __                   _                 
---  / ___| | ___ | |__   __ _| | |  \/  | __ _ _ __  _ __ (_)_ __   __ _ ___ 
--- | |  _| |/ _ \| '_ \ / _` | | | |\/| |/ _` | '_ \| '_ \| | '_ \ / _` / __|
--- | |_| | | (_) | |_) | (_| | | | |  | | (_| | |_) | |_) | | | | | (_| \__ \
---  \____|_|\___/|_.__/ \__,_|_| |_|  |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
---                                            |_|   |_|            |___/     
--- By EzBl4ck
-------------------------------------------------------------------------------

local map = vim.keymap

map.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map.set("n", "<leader>l", "<cmd>noh<CR>", { noremap = true, silent = true, desc = "Clear highlight" })
map.set("n", "<leader>i", "gg=G<CR>", { noremap = true, silent = true, desc = "Indent file" })
map.set("n", "<leader>ww", "<cmd> w<CR>", { noremap = true, silent = true, desc = "Save file" })
map.set("n", "<leader>wa", "<cmd> wa<CR>", { noremap = true, silent = true, desc = "Save all files" })
map.set("n", "<leader>qq", "<cmd> q!<CR>", { noremap = true, silent = true, desc = "Quit file" })
map.set("n", "<leader>qa", "<cmd> qa!<CR>", { noremap = true, silent = true, desc = "Quit all files" })
map.set("n", "<C-Up>", "<cmd> resize +2<CR>", { noremap = true, silent = true, desc = "Resize split" })
map.set("n", "<C-Down", "<cmd> resize -2<CR>", { noremap = true, silent = true, desc = "Resize split" })
map.set("n", "<C-Left>", "<cmd> vertical resize -2<CR>", { noremap = true, silent = true, desc = "Resize split" })
map.set("n", "<C-Right>", "<cmd> vertical resize +2<CR>", { noremap = true, silent = true, desc = "Resize split" })
map.set("n", "<Tab>", "<cmd> bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
map.set("n", "<S-Tab>", "<cmd> bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
map.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent from visual" })
map.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent from visual" })
map.set("v", "p", '"_dP', { noremap = true, silent = true, desc = "" })
