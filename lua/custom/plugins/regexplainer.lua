local ok, regexplainer = pcall(require, "regexplainer")

if not ok then
  return
end

local M = {}

M.setup = function()
  regexplainer.setup({
    mode = "narrative",
    auto = false,

    -- Whether to log debug messages
    debug = false,

    -- 'split', 'popup'
    display = "popup",

    mappings = {
      show = "gR",
    },

    narrative = {
      separator = "\n",
    },
  })
end

return M
