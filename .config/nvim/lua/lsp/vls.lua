-- ----------------------------------------------------------------------------
-- Vue Language Server
--
-- Requires: npm install -g vls
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#vls
-- ----------------------------------------------------------------------------
--
local lspconfig = require 'lspconfig'
local on_attach = function(client, bufnr)
  require('lsp.common').common_on_attach(client, bufnr)
end

lspconfig.vuels.setup {
  on_attach = on_attach,
  init_options = {
    config = {
      vetur = {
        completion = {
          autoImport = true,
        },
        validation = {
          interpolation = true,
          script = true,
          style = true,
          template = true,
          templateProps = true,
        },
        --[[ format = {
          defaultFormatter = {
            js = "none",
            ts = "none"
          },
          defaultFormatterOptions = {},
          scriptInitialIndent = false,
          styleInitialIndent = false
        }, ]]
      }
    }
  }
}

