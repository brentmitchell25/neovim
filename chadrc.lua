local M = {}

local plugin_conf = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"
local snippets = require "custom.plugins.luasnip"

require("telescope").load_extension "fzf"
require("telescope").load_extension "luasnip"
require("telescope").load_extension "env"
require "custom.treesitter"

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
  override = {
    ["L3MON4D3/LuaSnip"] = snippets.ls,
    ["kyazdani42/nvim-tree.lua"] = plugin_conf.nvimtree,
    ["hrsh7th/nvim-cmp"] = plugin_conf.cmp,
    ["nvim-telescope/telescope.nvim"] = plugin_conf.telescope,
  },
  user = userPlugins,
}

M.ui = {
  theme = "gruvbox",
}

M.mappings = require "custom.mappings"

return M
