local M = {}

function M.setup()

  local opts = {
    defaults = {
      path_display = { "truncate" },
    },
  }

  require("telescope").setup(opts)
  require("telescope").load_extension("fzf")
  local builtin = require("telescope.builtin")
  vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true, desc = "Fuzzy find files in cwd" })
  vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { noremap = true, silent = true, desc = "Fuzzy find recent files" })
  vim.keymap.set("n", "<leader>fs", builtin.live_grep, { noremap = true, silent = true, desc = "Find string in cwd" })
  vim.keymap.set("n", "<leader>fc", builtin.grep_string, { noremap = true, silent = true, desc = "Find string under cursor in cwd" })
end

return M
