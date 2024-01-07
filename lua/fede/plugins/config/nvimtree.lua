-------------------------------------------------
---  _   _       _         _____
--- | \ | |_   _(_)_ __ __|_   _| __ ___  ___
--- |  \| \ \ / / | '_ ` _ \| || '__/ _ \/ _ \
--- | |\  |\ V /| | | | | | | || | |  __/  __/
--- |_| \_| \_/ |_|_| |_| |_|_||_|  \___|\___|
---
--- By EzBl4ck
-------------------------------------------------

local M = {}

function M.setup()
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle NvimTree" })
  vim.keymap.set("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", { noremap = true, silent = true, desc = "Focus NvimTree" })

  require("nvim-tree").setup({
    view = {
      adaptive_size = false,
      side = "left",
      width = 30,
      preserve_window_proportions = true,
    },

    git = {
      enable = false,
      ignore = true,
    },

    actions = {
      open_file = {
        resize_window = true,
        window_picker = {
          enable = false,
        },
      },
    },

    renderer = {
      root_folder_label = false,
      highlight_git = false,
      highlight_opened_files = "none",

      indent_markers = {
        enable = false,
      },

      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = false,
        },

        glyphs = {
          default = "󰈚",
          symlink = "",
          folder = {
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = "",
            arrow_open = "",
            arrow_closed = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
  })

end

return M
