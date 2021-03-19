-- ----------------------------------------------------------------------------
-- HTML Language Server configuration
--
-- Requires : npm install -g vscode-html-languageserver-bin
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#html
-- ----------------------------------------------------------------------------

local lspconfig = require('lspconfig')
local common_on_attach = require('lsp.common').common_on_attach

local html_capabilities = vim.lsp.protocol.make_client_capabilities()
html_capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
  on_attach = common_on_attach,
  capabilities = html_capabilities,
}
