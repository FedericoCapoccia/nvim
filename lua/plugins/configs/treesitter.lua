local options = {

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
    "rust",
    "toml",
    "json",
    "xml",
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

return options
