local M = {}

function M.setup()

  -- these will be buffer-local keybindings
  -- because they only work if you have an active language server
  vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
      local opts = {buffer = event.buf}

      vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end
  })

  -- Setup LSP
  local lspconfig = require("lspconfig")
  lspconfig.clangd.setup {
    cmd = {
      "clangd",
      "--background-index",
      -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
      -- to add more checks, create .clang-tidy file in the root directory
      -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
      "--clang-tidy",
      "--completion-style=bundled",
      "--cross-file-rename",
      "--header-insertion=iwyu",
    }
  }
  lspconfig.tsserver.setup {}
  lspconfig.html.setup {}
  lspconfig.lua_ls.setup {}
  lspconfig.lemminx.setup {}
  lspconfig.cmake.setup {}

  -- LSP Mason
  require("mason").setup({})
  require("mason-lspconfig").setup({
    ensure_installed = {
      "clangd",
      "rust_analyzer",
      "lua_ls",
      "tsserver",
      "html",
      "lemminx",
      "cmake",
    },
    automatic_installation = true,
    handlers = {
      default_setup,
    },
  })
  -- Formatter and Linter Mason
  require("mason-null-ls").setup({
    ensure_installed = {
      "prettierd",
      "clang-format"
    },
    automatic_installation = true,
    automatic_setup = true,
    handlers = {}
  })

  -- Formatting
  require("conform").setup({
    formatters_by_ft = {
      lua = { "lua_ls" },
      javascript = { "prettierd" },
      javascriptreact = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      scss = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      yaml = { { "prettierd", "prettier" } },
      markdown = { { "prettierd", "prettier" } },

      rust = { "rustfmt" },
      cpp = { "clang_format" },
      c = { "clang_format" },
    },
  })
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      require("conform").format({ bufnr = args.buf })
    end,
  })

    -- Nvim cmp
  local cmp = require('cmp')

  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ['<C-Space>'] = cmp.mapping.complete(),
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

    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
  })

  -- Rust-tools
  local rust_tools = require('rust-tools')
  rust_tools.setup({
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
      end
    }
  })

  
  --local null_ls = require("null-ls")
  --local null_opts = lsp_zero.build_options("null-ls", {})

  --null_ls.setup({
    --on_attach = function(client, bufnr)
      --null_opts.on_attach(client, bufnr)
    --end,
    --sources = {
      --null_ls.builtins.formatting.prettierd,
    --}
  --})

  require("crates").setup({
    src = {
      cmp = {
        enabled = true,
      },
    },
  })

  vim.keymap.set('n', '<leader>qf', "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
end

return M
