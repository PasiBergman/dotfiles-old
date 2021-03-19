-- ----------------------------------------------------------------------------
-- Dockerfile Language Server
--
-- Requires: npm install -g dockerfile-language-server-nodejs
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#dockerls
-- ----------------------------------------------------------------------------
--
local lspconfig = require 'lspconfig'
local common_on_attach = require('lsp.common').common_on_attach

lspconfig.dockerls.setup {
  on_attach = common_on_attach,
}
