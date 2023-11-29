--------------------------------------------------------
--- __        ___     _      _       _  __          
--- \ \      / / |__ (_) ___| |__   | |/ /___ _   _ 
---  \ \ /\ / /| '_ \| |/ __| '_ \  | ' // _ \ | | |
---   \ V  V / | | | | | (__| | | | | . \  __/ |_| |
---    \_/\_/  |_| |_|_|\___|_| |_| |_|\_\___|\__, |
---                                           |___/ 
---  By EzBl4ck
--------------------------------------------------------

local M = {}

function M.setup()

  vim.o.timeout = true
  vim.o.timeoutlen = 300

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    f = { name = "Telescope" },
    q = { name = "Quit" },
    t = { name = "Theme" },
    w = { name = "Write" },
  }

  local whichkey = require("which-key")
  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
