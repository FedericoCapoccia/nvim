-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local options = {

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
}

return options
