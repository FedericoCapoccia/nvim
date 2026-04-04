vim.pack.add { "https://github.com/neovim/nvim-lspconfig" }

vim.lsp.enable {
    "lua_ls",
    "gopls",
    "ts_ls",
    -- "tsgo",
    "tailwindcss",
    "oxfmt",
    "oxlint",
}

vim.diagnostic.config { virtual_text = true, signs = true }

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local telescope_builtin = require "telescope.builtin"

vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
        },
    },
})

vim.lsp.config("oxfmt", {
    workspace_required = false,
})

-- NOTE: this is needed because of invald filetypes declared in
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/tailwindcss.lua
vim.lsp.config("tailwindcss", {
    filetypes = {
        -- html
        "astro",
        "clojure",
        "htmldjango",
        "elixir",
        "eruby", -- vim ft
        "haml",
        "handlebars",
        "html",
        "htmlangular",
        "heex",
        "liquid",
        "markdown",
        "php",
        "twig",
        -- css
        "css",
        "less",
        "sass",
        "scss",
        "stylus",
        -- js
        "javascript",
        "javascriptreact",
        "rescript",
        "typescript",
        "typescriptreact",
        -- mixed
        "vue",
        "svelte",
    },
})

-- See above
vim.lsp.config("gopls", {
    filetypes = { "go", "gomod" },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
            return
        end

        local function opts(desc)
            return { buffer = ev.buf, desc = "LSP " .. desc }
        end

        if client:supports_method "textDocument/inlayHint" then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end

        if client:supports_method "textDocument/completion" then
            client.server_capabilities = vim.tbl_deep_extend("force", client.server_capabilities, capabilities)
        end

        if client:supports_method "textDocument/codeAction" then
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
        else
            print(client.name .. " DOES NOT support Code Actions!")
        end

        if client:supports_method "textDocument/definition" then
            vim.keymap.set("n", "gd", function()
                telescope_builtin.builtin.lsp_definitions()
            end, opts "Go to definition")
        end

        if client:supports_method "textDocument/declaration" then
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
        end

        if client:supports_method "textDocument/implementation" then
            vim.keymap.set("n", "gi", function()
                telescope_builtin.lsp_implementations()
            end, opts "Go to implementation")
        end

        if client:supports_method "textDocument/hover" then
            vim.keymap.set("n", "<leader>sd", vim.lsp.buf.hover, opts "Hover documentation")
        end

        if client:supports_method "textDocument/rename" then
            vim.keymap.set("n", "<f2>", vim.lsp.buf.rename, opts "Rename")
        end
    end,
})

require "plugins.lsp.lua_ls"
