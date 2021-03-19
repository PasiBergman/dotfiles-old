-- ----------------------------------------------------------------------------
-- SQL Language Server configuration
--
-- Requires : npm install -g sql-language-server
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sqlls
-- ----------------------------------------------------------------------------

local lspconfig = require('lspconfig')
local common_on_attach = require('lsp.common').common_on_attach

lspconfig.sqlls.setup{
  on_attach = common_on_attach,
  cmd = {"sql-language-server", "up", "--method", "stdio"};
}
