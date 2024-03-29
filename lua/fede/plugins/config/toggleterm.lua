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
  --vim.keymap.set("n", "<leader>hh", "<cmd>ToggleTerm direction=horizontal size=35<CR>", { noremap = true, silent = true, desc = "Open Horizontal Terminal" })
  vim.keymap.set({"n", "t"}, "<C-t>", "<cmd>ToggleTerm direction=horizontal size=15<CR>", { noremap = true, silent = true, desc = "Open Floating Terminal" })
end

return M
