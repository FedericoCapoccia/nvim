vim.pack.add {
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim", version = "v0.2.1" },
}

require("telescope").setup {
    defaults = {
        file_ignore_patterns = { ".git/", "node_modules/", "vendor/" },
    },
}

local builtin = require "telescope.builtin"
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find project files", remap = true })
vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Search text in project", remap = true })
vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "Search help manual", remap = true })
vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "Search Project Diagnostics", remap = true })
