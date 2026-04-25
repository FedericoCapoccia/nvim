vim.pack.add { "https://github.com/neovim/nvim-lspconfig" }

vim.lsp.enable {
    "lua_ls",
    "gopls",
    "ts_ls",
    -- "tailwindcss",
    "oxfmt",
    "oxlint",
    "rust_analyzer",
    "zls",
    "nixd",
}

vim.diagnostic.config { virtual_text = true, signs = true }

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
    capabilities = vim.tbl_deep_extend("force", capabilities, {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
        },
    }),
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

        if client:supports_method "textDocument/codeAction" then
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
        end

        if client:supports_method "textDocument/definition" then
            vim.keymap.set("n", "gd", function()
                require("fzf-lua").lsp_definitions()
            end, opts "Go to definition")
        end

        if client:supports_method "textDocument/declaration" then
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
        end

        if client:supports_method "textDocument/implementation" then
            vim.keymap.set("n", "gi", function()
                require("fzf-lua").lsp_implementations()
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
