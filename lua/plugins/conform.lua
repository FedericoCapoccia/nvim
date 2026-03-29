vim.pack.add { { src = "https://github.com/stevearc/conform.nvim", name = "conform" } }

-- Thank you codex for this. Basically it uses vp fmt on web projects using vite-plus while falling back to oxfmt for
-- non vite-plus projects.

local uv = vim.uv or vim.loop
local function project_root(bufnr)
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local start = filename ~= "" and vim.fs.dirname(filename) or uv.cwd()
    local markers = vim.fs.find({ "package.json", "vite.config.ts", "vite.config.js" }, {
        upward = true,
        path = start,
        stop = uv.os_homedir(),
    })
    return markers[1] and vim.fs.dirname(markers[1]) or nil
end

local function is_vite_plus_project(bufnr)
    local root = project_root(bufnr)
    if not root then
        return false
    end
    local package_json = root .. "/package.json"
    if vim.fn.filereadable(package_json) == 0 then
        return false
    end
    local text = table.concat(vim.fn.readfile(package_json), "\n")
    return text:find '"vite%-plus"' ~= nil
end

local function web_formatters(bufnr)
    if is_vite_plus_project(bufnr) then
        return { "vp_fmt" }
    end
    return { "oxfmt", "biome", stop_after_first = true }
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
                return project_root(ctx.buf)
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
