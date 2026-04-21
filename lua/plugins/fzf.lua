vim.pack.add { "https://github.com/nvim-tree/nvim-web-devicons", "https://github.com/ibhagwan/fzf-lua" }

require("fzf-lua").setup {}

local fzf = require "fzf-lua"
vim.keymap.set("n", "<leader>pf", fzf.files, { desc = "Find project files" })
vim.keymap.set("n", "<leader>ps", fzf.live_grep, { desc = "Search text in project" })
vim.keymap.set("n", "<leader>ph", fzf.help_tags, { desc = "Search help manual" })
vim.keymap.set("n", "<leader>pd", fzf.diagnostics_document, { desc = "Search Project Diagnostics" })
