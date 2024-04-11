local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<leader>f", vim.lsp.buf.format)
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace all hover word
map("n", "<leader>i", "gg=G<CR>")
map("n", "<leader>ww", "<cmd> w<CR>")
map("n", "<leader>wa", "<cmd> wa<CR>")
map("n", "<leader>qq", "<cmd> q!<CR>")
map("n", "<leader>qa", "<cmd> qa!<CR>")
map("n", "<Tab>", "<cmd> bnext<CR>")
map("n", "<S-Tab>", "<cmd> bprevious<CR>")
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "p", '"_dP')
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
