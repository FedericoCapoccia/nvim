local colorschemes = {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("fede.plugins.colorschemes.config.onedark").setup()
    end,
    enabled = true,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  }

}

return colorschemes
