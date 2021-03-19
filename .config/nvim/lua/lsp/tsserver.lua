-- ----------------------------------------------------------------------------
-- TypeScript Language Server configuration
--
-- Requires: npm install -g typescript typescript-language-server
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tsserver
-- ----------------------------------------------------------------------------

local lspconfig = require('lspconfig')
local common_on_attach = require('lsp.common').common_on_attach

lspconfig.tsserver.setup {
  on_attach = common_on_attach,
  root_dir = lspconfig.util.root_pattern('.git', 'tsconfig.json', 'packages.json'),
  -- autostart = true,
}
