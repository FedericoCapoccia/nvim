local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup({
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
      "regex",
      "bash",
      "markdown",
      "markdown_inline",
      "go",
      "c_sharp",
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

  })
end

return M
