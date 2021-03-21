-- ----------------------------------------------------------------------------
-- Choose Eslint --fix or Prettier based on project configuration
-- ----------------------------------------------------------------------------
local node_utils = require("utils.node")

local M = {
  formatCommand = node_utils.get_formatter_command(),
  formatStdin = true,
}

return M
