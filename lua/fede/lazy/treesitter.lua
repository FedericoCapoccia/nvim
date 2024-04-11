return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "lua",
                "vim",
                "jsdoc",
                "rust",
                "toml",
                "c",
                "html",
                "javascript",
                "typescript",
                "json",
                "jsonc",
            },

            auto_install = true,

            indent = { enable = true },
            autotag = { enable = true },
            highlight = { enable = true },
        })
    end,
}
