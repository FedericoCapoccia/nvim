-------------------------------------------
---  ____  _             _
--- |  _ \| |_   _  __ _(_)_ __  ___
--- | |_) | | | | |/ _` | | "_ \/ __|
--- |  __/| | |_| | (_| | | | | \__ \
--- |_|   |_|\__,_|\__, |_|_| |_|___/
---                |___/
--- By EzBl4ck
-------------------------------------------

local mapper = require "plugins.configs.mappings"
local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.configs.nvimtree").setup()
    end,
  },

  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup {
        style = "warmer",
      }
      require("onedark").load()
    end,
  },

  {
    "famiu/bufdelete.nvim",
    init = function()
      mapper.map_bufdelete()
    end,
  },

  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    config = function()
      require("plugins.configs.bufferline").setup()
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },

  {
    "windwp/nvim-autopairs",
    dependencies = { "hrsh7th/nvim-cmp" },
    event = "InsertEnter",
    config = function()
      require("plugins.configs.autopairs").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("plugins.configs.treesitter").setup()
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require("dressing").setup()
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.configs.telescope").setup()
    end,
  },

  {
    "stevearc/stickybuf.nvim",
    dependencies = {
      "akinsho/toggleterm.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("stickybuf").setup()
    end
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("plugins.configs.toggleterm").setup()
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    priority = 999,
    config = function()
      require("plugins.configs.which-key").setup()
    end,
  },

  {
    "github/copilot.vim"
  },

  {
    "Exafunction/codeium.vim",
    enabled = false
  },

  {
    "barrett-ruth/live-server.nvim",
    build = "yarn global add live-server",
    config = function()
      require("live-server").setup()
    end
  },

  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      "williamboman/mason.nvim",
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "simrat39/rust-tools.nvim",
      "nvimtools/none-ls.nvim",
      "jay-babu/mason-null-ls.nvim",
      "saecki/crates.nvim",
    },
    config = function()
      require("plugins.configs.lsp").setup()
    end,
  },
}

return plugins
