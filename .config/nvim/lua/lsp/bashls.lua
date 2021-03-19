-- ----------------------------------------------------------------------------
-- Bash Language Server configuration
--
-- Requires : npm install -g bash-language-server
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashls
-- ----------------------------------------------------------------------------

local lspconfig = require('lspconfig')
local common_on_attach = require('lsp.common').common_on_attach

lspconfig.bashls.setup {
  on_attach = common_on_attach,
}
