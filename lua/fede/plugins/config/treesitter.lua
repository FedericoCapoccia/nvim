----------------------------------------------------
---  _____              ____  _ _   _
--- |_   _| __ ___  ___/ ___|(_) |_| |_ ___ _ __
---   | || '__/ _ \/ _ \___ \| | __| __/ _ \ '__|
---   | || | |  __/  __/___) | | |_| ||  __/ |
---   |_||_|  \___|\___|____/|_|\__|\__\___|_|
---
--- By EzBl4ck
----------------------------------------------------

local M = {}

function M.setup()
  local opts = {
    highlight = {
      enable = true,
    },

    indent = { enable = true },

    autotag = {
      enable = true,
    },

    ensure_installed = {
      "lua",
      "vim",
      "gitignore",
      "c",
      "cpp",
      "cmake",
      "make",
      "meson",
      "rust",
      "toml",
      "json",
      "xml",
      "html",
      "javascript",
      "typescript",
      "css",
      "java",
      "python",
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  }

  require("nvim-treesitter.configs").setup(opts)
end

return M
