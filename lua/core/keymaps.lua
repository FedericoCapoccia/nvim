-- Keymaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Close file" })

-- Window management
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and keep selection" })

-- Comments
vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- Buffer management
vim.keymap.set("n", "<Tab>", "<cmd>bnext <cr>", { desc = "Move to next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious <cr>", { desc = "Move to previous buffer" })

vim.keymap.set("n", "<leader>x", function()
    local bufnr = vim.api.nvim_get_current_buf()

    if vim.bo[bufnr].modified then
        vim.notify("Buffer is modified! Save before closing.", vim.log.levels.ERROR)
        return
    end
    vim.cmd "bprevious"
    if bufnr == vim.api.nvim_get_current_buf() then
        vim.cmd "enew"
    end
    vim.cmd("silent! bdelete " .. bufnr)
end, { desc = "Close buffer safely" })
