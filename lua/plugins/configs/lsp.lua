local M = {}

function M.setup()

  -- Lsp-Zero
  local lsp_zero = require("lsp-zero").preset({})

  lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
  end)

  lsp_zero.setup_servers({
    exclude = { "rust_analyzer" }
  })

  lsp_zero.setup()

  -- Rust-tools
  local rust_tools = require('rust-tools')
  rust_tools.setup({
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, {buffer = bufnr})
      end
    }
  })

  -- Nvim cmp
  local cmp = require('cmp')
  local cmp_action = require('lsp-zero').cmp_action()

  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({select = true}),
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
  })

  -- Mason
  require("mason").setup({})
  require("mason-lspconfig").setup({

    ensure_installed = {
      "clangd",
      "rust_analyzer",
      "lua_ls",
    },
    automatic_installation = true,

    handlers = {
      lsp_zero.default_setup,
    },
  })
end

return M
