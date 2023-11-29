-----------------------------------------------------
---     _         _                    _          
---    / \  _   _| |_ ___  _ __   __ _(_)_ __ ___ 
---   / _ \| | | | __/ _ \| '_ \ / _` | | '__/ __|
---  / ___ \ |_| | || (_) | |_) | (_| | | |  \__ \
--- /_/   \_\__,_|\__\___/| .__/ \__,_|_|_|  |___/
---                       |_|                     
---  By EzBl4ck
-----------------------------------------------------

local M = {}

function M.setup()

  local opts = {
    check_ts = true,
  }

  require("nvim-autopairs").setup(opts)

  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  local cmp = require("cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

end

return M
