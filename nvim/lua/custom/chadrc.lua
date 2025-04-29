---@type ChadrcConfig
local M = {}
M.ui = {
  theme = 'catppuccin',
  tabufline = {
    enabled = true
  }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
