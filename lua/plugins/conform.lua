vim.pack.add { { src = "https://github.com/stevearc/conform.nvim", name = "conform" } }

-- Thank you codex for this. Basically it uses vp fmt on web projects using vite-plus while falling back to oxfmt for
-- non vite-plus projects.

local function is_vite_plus_project(bufnr)
    local filename = vim.api.nvim_buf_get_name(bufnr)
    if filename == "" then
        return false
    end
    local vite_config = vim.fs.find("vite.config.ts", {
        upward = true,
        path = vim.fs.dirname(filename),
    })[1]
    return vite_config ~= nil
end

local function web_formatters(bufnr)
    if is_vite_plus_project(bufnr) then
        return { "vp_fmt" }
    end
    return { "oxfmt", stop_after_first = true }
end

require("conform").setup {
    formatters_by_ft = {
        javascript = web_formatters,
        typescript = web_formatters,
        javascriptreact = web_formatters,
        typescriptreact = web_formatters,
        json = web_formatters,
        jsonc = web_formatters,
        html = web_formatters,
        css = web_formatters,
        lua = { "stylua" },
    },
    formatters = {
        vp_fmt = {
            command = "vp",
            args = { "fmt", "$FILENAME", "--write" },
            stdin = false,
            require_cwd = true,
            cwd = function(_, ctx)
                return vim.fs.dirname(vim.fs.find("vite.config.ts", {
                    upward = true,
                    path = vim.fs.dirname(ctx.filename),
                })[1])
            end,
        },
    },
    format_on_save = function(bufnr)
        if is_vite_plus_project(bufnr) then
            return
        end
        return {
            timeout_ms = 500,
            lsp_format = "fallback",
        }
    end,
    format_after_save = function(bufnr)
        if not is_vite_plus_project(bufnr) then
            return
        end
        return {
            lsp_format = "fallback",
        }
    end,
    default_format_opts = {
        lsp_format = "fallback",
    },
}

vim.keymap.set("n", "<leader>ff", function()
    require("conform").format { async = true, lsp_format = "fallback" }
end, { desc = "Format buffer" })
