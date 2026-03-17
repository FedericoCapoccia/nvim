vim.pack.add { { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" } }

require("nvim-treesitter").setup {}

require("nvim-treesitter").install { "lua", "go" }

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true }),
    pattern = "*",
    callback = function()
        local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
        if lang then
            local ok = pcall(vim.treesitter.start)
            if ok then
                vim.wo[0][0].foldmethod = "expr"
                vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
        end
    end,
})
