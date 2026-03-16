vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                enable = true,
                globals = { "vim" },
            },
        },
    },
})
