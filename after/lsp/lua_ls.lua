return {
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
                    vim.fn.expand "~/.local/share/lua-addons/premake-language-support/library",
                },
                checkThirdParty = false,
            },
        },
    },
}
