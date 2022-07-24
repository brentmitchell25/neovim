local M = {}

local override = require "custom.override"
local userPlugins = require "custom.plugins"
local snippets = require "custom.plugins.luasnip"

M.plugins = {
  override = {
    ["L3MON4D3/LuaSnip"] = snippets.override,
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["hrsh7th/nvim-cmp"] = override.cmp,
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["nvim-telescope/telescope.nvim"] = override.telescope,
  },
  user = userPlugins,
}

M.ui = {
  theme = "gruvbox",
}

M.mappings = require "custom.mappings"

return M
