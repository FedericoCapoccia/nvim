-----------------------------------------------------------
---  _____                 _     _____
--- |_   _|__   __ _  __ _| | __|_   _|__ _ __ _ __ ___
---   | |/ _ \ / _` |/ _` | |/ _ \| |/ _ \ '__| '_ ` _ \
---   | | (_) | (_| | (_| | |  __/| |  __/ |  | | | | | |
---   |_|\___/ \__, |\__, |_|\___||_|\___|_|  |_| |_| |_|
---            |___/ |___/
--- By EzBl4ck
-----------------------------------------------------------

local M = {}

function M.setup()
  local opts = {
    shade_filetypes = {},
    direction = "float",
    shade_terminals = true,
    shading_factor = 1,
    start_in_insert = true,
    persist_size = true,
  }

  require("toggleterm").setup(opts)
  vim.keymap.set("n", "<leader>hh", "<cmd>ToggleTerm direction=horizontal size=35<CR>", { noremap = true, silent = true, desc = "Open Horizontal Terminal" })
  vim.keymap.set("n", "<leader>hf", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true, desc = "Open Floating Terminal" }) 
end

return M
