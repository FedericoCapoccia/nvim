vim.pack.add { "https://github.com/neovim/nvim-lspconfig" }

vim.lsp.enable {
    "lua_ls",
    "gopls",
}

vim.diagnostic.config { virtual_text = true, signs = true }

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local telescope_builtin = require "telescope.builtin"

vim.lsp.config("*", {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
        end

        map("<leader>c", vim.lsp.buf.code_action, "Code action")
        map("<F2>", vim.lsp.buf.rename, "Rename")
        map("<leader>sd", vim.lsp.buf.hover, "Hover documentation")

        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gD", vim.lsp.buf.declaration, "Go to declaration")
        map("gi", vim.lsp.buf.implementation, "Go to implementation")
        map("gr", telescope_builtin.lsp_references, "Go to references")

        if client:supports_method "textDocument/inlayHint" then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
    end,
})

require "plugins.lsp.lua_ls"
