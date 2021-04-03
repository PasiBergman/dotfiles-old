-- ----------------------------------------------------------------------------
-- Collection of Nvim specific utility functions
--
-- local nvim = require('utils.nvim')
-- ----------------------------------------------------------------------------
local M = {}
--
-- Nvim options helper
--
M.opt = function(scope, key, value)
  local scopes = { o = vim.o, b = vim.bo, w = vim.wo }
  scopes[scope][key] = value
  if scope ~= "o" then scopes["o"][key] = value end
end
--
-- key mapper
--
M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return M
