local M = {}

function M.setup()
  -- Lsp-Zero
  local lsp_zero = require("lsp-zero").preset({})

  lsp_zero.on_attach(function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })

    vim.keymap.set({ 'n', 'x' }, 'gq', function()
      vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, { buffer = bufnr, desc = "Format file" })
  end)

  lsp_zero.setup_servers({
    exclude = { "rust_analyzer" }
  })

  lsp_zero.format_on_save({
    format_opts = {
      async = false,
      timeout_ms = 10000,
    },
    servers = {
      ["null-ls"] = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "html",
        "css",
        "scss",
        "json",
        "yaml",
        "markdown",
      },
      ["rust_analyzer"] = { "rust" },
      ["clangd"] = { "c", "cpp" },
      ["lua_ls"] = { "lua" },
      ["lemminx"] = { "xml" },
    }
  })

  lsp_zero.setup()

  -- Rust-tools
  local rust_tools = require('rust-tools')
  rust_tools.setup({
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
      end
    }
  })

  local null_ls = require("null-ls")
  local null_opts = lsp_zero.build_options("null-ls", {})

  null_ls.setup({
    on_attach = function(client, bufnr)
      null_opts.on_attach(client, bufnr)
    end,
    sources = {
      null_ls.builtins.formatting.prettierd,
    }
  })

  require("crates").setup({
    src = {
      cmp = {
        enabled = true,
      },
    },
  })

  -- Nvim cmp
  local cmp = require('cmp')
  local cmp_action = require('lsp-zero').cmp_action()

  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      --["<S-Tab>"] = cmp.mapping.select_prev_item(),
      --["<Tab>"] = cmp.mapping.select_next_item(),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),

    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    formatting = {
      format = function(_, vim_item)
        vim_item.menu = nil
        return vim_item
      end
    },

    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "crates" },
    }),
  })

  -- Mason
  require("mason").setup({})
  require("mason-lspconfig").setup({

    ensure_installed = {
      "clangd",
      "rust_analyzer",
      "lua_ls",
      "tsserver",
      "html",
      "lemminx",
    },
    automatic_installation = true,

    handlers = {
      lsp_zero.default_setup,
    },
  })

  require("mason-null-ls").setup({
    ensure_installed = {
      "prettierd",
    },
    automatic_installation = true,
    automatic_setup = false,
  })
end

return M
