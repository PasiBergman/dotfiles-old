-- ----------------------------------------------------------------------------
-- Python Language Server (Microsoft) configuration
--
-- Requires : npm install -g pyright
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#pyright
-- ----------------------------------------------------------------------------

local lspconfig = require 'lspconfig'
local common_on_attach = require('lsp.common').common_on_attach

lspconfig.pyright.setup {
  on_attach = common_on_attach,
}
