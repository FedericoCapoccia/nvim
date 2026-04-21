# Neovim Config Improvement Plan

## 1. Add which-key.nvim

**New file: `lua/plugins/whichkey.lua`**
```lua
vim.pack.add { "https://github.com/folke/which-key.nvim" }

require("which-key").setup()
```

---

## 2. Auto-Discover Plugins with vim.fs.dir()

**Replace `lua/plugins/init.lua` contents:**

```lua
local plugins_dir = vim.fn.stdpath "config" .. "/lua/plugins"

for name, type in vim.fs.dir(plugins_dir) do
    if type == "directory" then
        require("plugins." .. name)
    elseif name:match "%.lua$" and name ~= "init.lua" then
        require("plugins." .. name:sub(1, -5))
    end
end
```

This automatically loads:
- Flat files: `theme.lua`, `lualine.lua`, `gitsigns.lua`, etc.
- Subdirectories: `lsp/` (loads `lsp/init.lua`)
- New files you add in the future — no need to touch init.lua again

---

## 3. Fix LSP Capabilities Merge in LspAttach

**Problem:** Lines 141-143 of `lua/plugins/lsp/init.lua` merge cmp capabilities into `client.server_capabilities` on every buffer attach. This is unnecessary — capabilities should be set once at config time.

**In `lua/plugins/lsp/init.lua`:**

Replace lines 20-28:
```lua
-- FROM:
vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
        },
    },
})

-- TO:
vim.lsp.config("*", {
    capabilities = vim.tbl_deep_extend("force", capabilities, {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
        },
    }),
})
```

Then **delete lines 141-143** (the LspAttach merge block):
```lua
-- DELETE:
if client:supports_method "textDocument/completion" then
    client.server_capabilities = vim.tbl_deep_extend("force", client.server_capabilities, capabilities)
end
```

---

## 4. Clean Up `remap = true` on Ex Command Mappings

`remap = true` is meaningless when the RHS is a `<cmd>` Ex command. Remove it where it has no effect.

**In `lua/core/keymaps.lua`:**

| Line | From | To |
|------|------|-----|
| 3 | `{ desc = "Save file", remap = true }` | `{ desc = "Save file" }` |
| 4 | `{ desc = "Close file", remap = true }` | `{ desc = "Close file" }` |
| 17 | `{ desc = "Toggle comment", remap = true }` | `{ desc = "Toggle comment" }` |
| 18 | `{ desc = "Toggle comment", remap = true }` | `{ desc = "Toggle comment" }` |
| 48 | `{ desc = "Close buffer safely", remap = true }` | `{ desc = "Close buffer safely" }` |

**Keep `remap = true`** on lines 7-10 — those map to `<C-w><C-h>` etc. which ARE key sequences, so remap is correct.

**In `lua/plugins/telescope.lua`:**

| Line | From | To |
|------|------|-----|
| 14 | `{ desc = "Find project files", remap = true }` | `{ desc = "Find project files" }` |
| 15 | `{ desc = "Search text in project", remap = true }` | `{ desc = "Search text in project" }` |
| 16 | `{ desc = "Search help manual", remap = true }` | `{ desc = "Search help manual" }` |
| 17 | `{ desc = "Search Project Diagnostics", remap = true }` | `{ desc = "Search Project Diagnostics" }` |

---

## Summary of File Changes

| File | Action |
|------|--------|
| `lua/plugins/whichkey.lua` | **CREATE** — which-key.nvim plugin |
| `lua/plugins/init.lua` | **MODIFY** — replace with vim.fs.dir() auto-discovery |
| `lua/core/keymaps.lua` | **MODIFY** — remove useless `remap = true` |
| `lua/plugins/lsp/init.lua` | **MODIFY** — merge cmp capabilities globally, remove LspAttach workaround |
| `lua/plugins/telescope.lua` | **MODIFY** — remove useless `remap = true` |
