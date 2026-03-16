vim.pack.add({"https://github.com/neovim/nvim-lspconfig"})

vim.lsp.enable({
    "lua-language-server",
})

vim.diagnostic.config({ virtual_text = true })

require("plugins.lsp.lua_ls")
