-- ----------------------------------------------------------------------------
-- CSS Language Server configuration
--
-- Requires : npm install -g vscode-css-languageserver-bin
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#cssls
-- ----------------------------------------------------------------------------

local lspconfig = require('lspconfig')
local common_on_attach = require('lsp.common').common_on_attach

lspconfig.cssls.setup {
  on_attach = common_on_attach,
  root_dir = lspconfig.util.root_pattern('.git', '.stylelintrc.json', 'packages.json'),
}
