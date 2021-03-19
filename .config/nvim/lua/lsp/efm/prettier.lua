-- ----------------------------------------------------------------------------
-- Prettier formatter
-- ----------------------------------------------------------------------------
local M = {
  -- formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true,
}

return M

