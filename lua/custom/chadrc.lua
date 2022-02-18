local M = {}

local plugin_conf = require("custom.plugins.configs")
local userPlugins = require("custom.plugins")

M.plugins = {
  status = {
    colorizer = true,
    snippets = true,
  },
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
  default_plugin_config_replace = {
    nvim_tree = plugin_conf.nvimtree,
    nvim_cmp = plugin_conf.cmp,
  },
  install = userPlugins,
}

M.mappings = {
  misc = {
    copy_whole_file = "<leader>cf",
  },
}

return M
