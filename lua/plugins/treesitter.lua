vim.pack.add { "https://github.com/romus204/tree-sitter-manager.nvim" }

require("tree-sitter-manager").setup {
    auto_install = true,
}

-- require("nvim-treesitter").install {
--     -- Lang
--     "lua",
--     "go",
--     "zig",
--     "c",
--     "cpp",
--     "rust",
--
--     -- Web
--     "html",
--     "css",
--     "javascript",
--     "typescript",
--     "tsx",
--     "json",
--     "graphql",
--     "http",
--
--     -- Config / markup
--     "toml",
--     "yaml",
--     "dockerfile",
--     "bash",
--     "markdown",
--     "markdown_inline",
-- }
--
-- vim.api.nvim_create_autocmd("FileType", {
--     group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true }),
--     pattern = "*",
--     callback = function()
--         local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
--         if lang then
--             local ok = pcall(vim.treesitter.start)
--             if ok then
--                 vim.wo[0][0].foldmethod = "expr"
--                 vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
--                 vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--             end
--         end
--     end,
-- })
