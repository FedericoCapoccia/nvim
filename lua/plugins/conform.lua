vim.pack.add { { src = "https://github.com/stevearc/conform.nvim", name = "conform" } }

require("conform").setup {
    formatters_by_ft = {
        javascript = { "vp_fmt", "oxfmt", stop_after_first = true },
        typescript = { "vp_fmt", "oxfmt", stop_after_first = true },
        javascriptreact = { "vp_fmt", "oxfmt", stop_after_first = true },
        typescriptreact = { "vp_fmt", "oxfmt", stop_after_first = true },
        json = { "vp_fmt", "oxfmt", stop_after_first = true },
        jsonc = { "vp_fmt", "oxfmt", stop_after_first = true },
        html = { "vp_fmt", "oxfmt", stop_after_first = true },
        css = { "vp_fmt", "oxfmt", stop_after_first = true },
        lua = { "stylua" },
    },

    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },

    default_format_opts = {
        lsp_format = "fallback",
    },

    formatters = {
        vp_fmt = {
            command = "vp",
            args = { "fmt", "$FILENAME", "--write" },
            stdin = false,
            require_cwd = true,
            cwd = require("conform.util").root_file { "vite.config.ts", "package.json" },
        },
    },
}

vim.keymap.set("n", "<leader>ff", function()
    require("conform").format { async = true, lsp_format = "fallback" }
end, { desc = "Format buffer" })
