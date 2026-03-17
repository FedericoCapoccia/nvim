vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                enable = true,
                globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                    vim.fn.stdpath "config" .. "/lua",
                },
                checkThirdParty = false,
            },
        },
    },
})
