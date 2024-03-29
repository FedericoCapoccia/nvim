local plugins = {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("fede.plugins.config.neotree").setup()
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
      require("lualine").setup({
        extensions = { "neo-tree", "lazy" }
      })
    end,
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour="#000000"
      })
    end
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("fede.plugins.config.noice").setup()
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
    "windwp/nvim-autopairs",
    dependencies = { "hrsh7th/nvim-cmp" },
    event = "InsertEnter",
    config = function()
      require("fede.plugins.config.autopairs").setup()
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

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("fede.plugins.config.toggleterm").setup()
    end,
  },

  {
    'jmederosalvarado/roslyn.nvim',
    dependencies = {'hrsh7th/cmp-nvim-lsp'},
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("roslyn").setup({
          on_attach =  function (_,_)
          end,
          capabilities = capabilities
      })
    end
  },
}
return plugins
