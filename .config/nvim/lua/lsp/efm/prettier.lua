-- ----------------------------------------------------------------------------
-- Prettier formatter
-- ----------------------------------------------------------------------------
local node_utils = require("utils.node")

local M = {
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true,
}

return M
