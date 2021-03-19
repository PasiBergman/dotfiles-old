-- ----------------------------------------------------------------------------
-- Yaml Language Server configuration
--
-- Requires: npm install -g yaml-language-server
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#yamlls
-- ----------------------------------------------------------------------------

local lspconfig = require('lspconfig')
local common_on_attach = require('lsp.common').common_on_attach

lspconfig.yamlls.setup {
  on_attach = common_on_attach,
  --[[ cmd = { 'yaml-language-server', '--stdio' },
  autostart = true, ]]
}
