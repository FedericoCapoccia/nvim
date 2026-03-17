vim.pack.add { { src = "https://github.com/stevearc/conform.nvim", name = "conform" } }

require("conform").setup {
    formatters_by_ft = {
        javascript = { "prettierd", "biome", stop_after_first = true },
        typescript = { "prettierd", "biome", stop_after_first = true },
        javascriptreact = { "prettierd", "biome", stop_after_first = true },
        typescriptreact = { "prettierd", "biome", stop_after_first = true },
        json = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        lua = { "stylua" },
    },

    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },

    default_format_opts = {
        lsp_format = "fallback",
    },
}

vim.keymap.set("n", "<leader>ff", function()
    require("conform").format { async = true, lsp_format = "fallback" }
end, { desc = "Format buffer" })
