local config = require("dial.config")
local augend = require("dial.augend")

local M = {}

M.setup = function()
  --dial.setup()
  config.augends:register_group({
    default = {
      augend.integer.alias.decimal,
      augend.integer.alias.decimal_int,
      augend.integer.alias.hex,
      augend.integer.alias.octal,
      augend.integer.alias.binary,
      augend.date.alias["%Y/%m/%d"],
      augend.date.alias["%m/%d/%Y"],
      augend.date.alias["%d/%m/%Y"],
      augend.date.alias["%m/%d/%y"],
      augend.date.alias["%d/%m/%y"],
      augend.date.alias["%m/%d"],
      augend.date.alias["%-m/%-d"],
      augend.date.alias["%Y-%m-%d"],
      augend.date.alias["%H:%M:%S"],
      augend.date.alias["%H:%M"],
      augend.constant.alias.bool,
      augend.constant.alias.alpha,
      augend.constant.alias.Alpha,
      augend.semver.alias.semver,
    },
  })
end

return M
