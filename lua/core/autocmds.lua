-- FileType CMDs

local indent_group = vim.api.nvim_create_augroup("FileTypeIndentation", {
    clear = true
})

vim.api.nvim_create_autocmd("FileType", {
    group = indent_group,
    desc = "Set 2-space indent for web development files.",
    pattern = { 
        "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "css", "html" 
    },
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = indent_group,
    desc = "Set hard tabs for Go files.",
    pattern = { "go" },
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.shiftwidth = 8
        vim.opt_local.tabstop = 8
        vim.opt_local.softtabstop = 8
    end,
})
