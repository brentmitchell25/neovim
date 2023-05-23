local M = {}

M.setup = function()
  local neotest = require "neotest"

  neotest.setup {
    adapters = {
      require "neotest-jest" {
        jestCommand = "npm test --",
      },
      -- require "neotest-go",
    },
  }
end

return M
