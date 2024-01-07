local M = {}

function M.setup()
  require("onedark").setup {
    style = "darker",
    transparent = false,
    lualine = {
      transparent = true,
    },
  }
end

return M
