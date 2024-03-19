local M = {}

function M.setup()
  local opts = {
    options = {
      mode = "buffers",
    }
  }
  require("bufferline").setup(opts)
end
return M
