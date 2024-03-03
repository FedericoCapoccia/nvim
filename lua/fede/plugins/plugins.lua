-------------------------------------------
---  ____  _             _
--- |  _ \| |_   _  __ _(_)_ __  ___
--- | |_) | | | | |/ _` | | "_ \/ __|
--- |  __/| | |_| | (_| | | | | \__ \
--- |_|   |_|\__,_|\__, |_|_| |_|___/
---                |___/
--- By EzBl4ck
-------------------------------------------

local plugins = {
  "lambdalisue/suda.vim",
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("fede.plugins.config.nvimtree").setup()
    end,
  },

  {
    "famiu/bufdelete.nvim",
    init = function()
      vim.keymap.set("n", "<leader>x", "<cmd> Bdelete<CR>", { noremap = true, silent = true, desc = "Delete Buffer" })
    end,
  },

  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    config = function()
      require("fede.plugins.config.bufferline").setup()
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
      require("fede.plugins.config.autopairs").setup()
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
      require("fede.plugins.config.treesitter").setup()
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
      require("fede.plugins.config.telescope").setup()
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
      require("fede.plugins.config.toggleterm").setup()
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    priority = 999,
    config = function()
      require("fede.plugins.config.which-key").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",

      "nvimtools/none-ls.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",

      "stevearc/conform.nvim",

      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",

      "simrat39/rust-tools.nvim",
      "saecki/crates.nvim",
    },
    config = function()
      require("fede.plugins.config.lsp").setup()
    end,
  },

}

return plugins
