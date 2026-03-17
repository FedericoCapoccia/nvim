vim.pack.add {
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
}

require("lualine").setup {
    disabled_filetypes = {
        statusline = {},
        winbar = {},
    },
    globalstatus = true,
    tabline = {
        lualine_a = { "buffers" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "tabs" },
    },
}
