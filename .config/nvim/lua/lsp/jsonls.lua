-- ----------------------------------------------------------------------------
-- Json Language Server configuration
--
-- Requires : npm install -g vscode-json-languageserver
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#jsonls
-- ----------------------------------------------------------------------------

local lspconfig = require('lspconfig')
local common_on_attach = require('lsp.common').common_on_attach

lspconfig.jsonls.setup{
  on_attach = common_on_attach,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}
