local M = {}

local plugin_conf = require("custom.plugins.configs")
local userPlugins = require("custom.plugins")

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
  override = {
    ["kyazdani42/nvim-tree.lua"] = plugin_conf.nvimtree,
    ["hrsh7th/nvim-cmp"] = plugin_conf.cmp,
  },
  user = userPlugins,
}

return M
