vim.pack.add { {
    src = "https://github.com/rose-pine/neovim",
    name = "rose-pine",
} }

require("rose-pine").setup {
    enable = {
        legacy_highlights = false,
    },

    styles = {
        transparency = true,
        italic = false,
        bold = true,
    },

    highlight_groups = {
        Comment = { italic = true },
    },
}

vim.cmd "colorscheme rose-pine"
