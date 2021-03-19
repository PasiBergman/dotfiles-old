-- ----------------------------------------------------------------------------
-- Vim Language Server configuration
--
-- Requires : npm install -g vim-language-server
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#vimls
-- ----------------------------------------------------------------------------

local lspconfig = require('lspconfig')
local common_on_attach = require('lsp.common').common_on_attach

lspconfig.vimls.setup{
  on_attach = common_on_attach,
}
