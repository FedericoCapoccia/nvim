--------------------------------------------------
---  _____    _                                
--- |_   _|__| | ___  ___  ___ ___  _ __   ___ 
---   | |/ _ \ |/ _ \/ __|/ __/ _ \| '_ \ / _ \
---   | |  __/ |  __/\__ \ (_| (_) | |_) |  __/
---   |_|\___|_|\___||___/\___\___/| .__/ \___|
---                                |_|         
--- By EzBl4ck
--------------------------------------------------

local M = {}

function M.setup()

  local opts = {
    defaults = {
      path_display = { "truncate" },
    },
  }

  require("telescope").setup(opts)
  require("telescope").load_extension("fzf")
  require("plugins.configs.mappings").map_telescope()
end

return M
