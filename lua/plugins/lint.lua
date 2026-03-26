vim.pack.add { "https://github.com/mfussenegger/nvim-lint" }

require("lint").linters_by_ft = {
    javascript = { "eslint" },
    typescript = { "eslint" },
    javascriptreact = { "eslint" },
    typescriptreact = { "eslint" },

}
