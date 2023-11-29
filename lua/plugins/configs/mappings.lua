-----------------------------------------------------------------------------------
---  ____  _             _             __  __                   _                 
--- |  _ \| |_   _  __ _(_)_ __  ___  |  \/  | __ _ _ __  _ __ (_)_ __   __ _ ___ 
--- | |_) | | | | |/ _` | | '_ \/ __| | |\/| |/ _` | '_ \| '_ \| | '_ \ / _` / __|
--- |  __/| | |_| | (_| | | | | \__ \ | |  | | (_| | |_) | |_) | | | | | (_| \__ \
--- |_|   |_|\__,_|\__, |_|_| |_|___/ |_|  |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
---                |___/                           |_|   |_|            |___/     
---  By EzBl4ck
-----------------------------------------------------------------------------------

local M = {}
local map = vim.keymap

-- Mappings for nvim-cmp in configs/nvim-cmp.lua

function M.map_bufdelete()
  map.set("n", "<leader>x", "<cmd> Bdelete<CR>", { noremap = true, silent = true, desc = "Delete Buffer" })
end

function M.map_nvimtree()
  map.set("n", "<C-n>", "<cmd> NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle NvimTree" })
  map.set("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", { noremap = true, silent = true, desc = "Focus NvimTree" })
end

function M.map_telescope()
  local builtin = require("telescope.builtin")
  map.set("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true, desc = "Fuzzy find files in cwd" })
  map.set("n", "<leader>fr", builtin.oldfiles, { noremap = true, silent = true, desc = "Fuzzy find recent files" })
  map.set("n", "<leader>fs", builtin.live_grep, { noremap = true, silent = true, desc = "Find string in cwd" })
  map.set("n", "<leader>fc", builtin.grep_string, { noremap = true, silent = true, desc = "Find string under cursor in cwd" })
  map.set("n", "<leader>th", builtin.colorscheme, { noremap = true, silent = true, desc = "List colorschemes" })
end

function M.map_toggleterm()
  map.set("n", "<leader>h",  "<cmd>ToggleTerm <CR>", { noremap = true, silent = true, desc = "Open Horizontal Terminal" })
end

return M
