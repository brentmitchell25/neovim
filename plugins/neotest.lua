local ok, neotest = pcall(require, "neotest")

if not ok then
  return
end

local M = {}

M.setup = function()
  neotest.setup {
    adapters = {
      require "neotest-plenary",
      require "neotest-jest",
      require "neotest-go",
    },
  }
end

return M
