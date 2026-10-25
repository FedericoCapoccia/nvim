vim.pack.add { "https://github.com/stevearc/conform.nvim" }

require("conform").setup {
    formatters_by_ft = {
        lua = { "stylua", lsp_format = "never" },
        nix = { "nixfmt" },
    },

    format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
    },
}

vim.keymap.set("n", "<leader>ff", function()
    require("conform").format { async = true }
end, { desc = "Format buffer" })
