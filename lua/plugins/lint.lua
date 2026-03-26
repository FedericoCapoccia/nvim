vim.pack.add { "https://github.com/mfussenegger/nvim-lint" }

require("lint").linters_by_ft = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },

}
