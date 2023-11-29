-----------------------------------------------------------
---  _____                 _     _____                   
--- |_   _|__   __ _  __ _| | __|_   _|__ _ __ _ __ ___  
---   | |/ _ \ / _` |/ _` | |/ _ \| |/ _ \ '__| '_ ` _ \ 
---   | | (_) | (_| | (_| | |  __/| |  __/ |  | | | | | |
---   |_|\___/ \__, |\__, |_|\___||_|\___|_|  |_| |_| |_|
---            |___/ |___/                               
--- By EzBl4ck
-----------------------------------------------------------

local M = {}

function M.setup()

  local opts =  {
    size = 15,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 1,
    start_in_insert = true,
    persist_size = true,
    direction = "horizontal",
  }

  require("toggleterm").setup(opts)
  require("plugins.configs.mappings").map_toggleterm()
end

return M
