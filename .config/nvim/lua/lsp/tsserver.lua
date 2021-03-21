-- ----------------------------------------------------------------------------
-- TypeScript Language Server configuration
--
-- Requires: npm install -g typescript typescript-language-server
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tsserver
-- ----------------------------------------------------------------------------
--
local lspconfig = require("lspconfig")
local common_on_attach = require("lsp.common").common_on_attach

local tsserver_on_attach = function(client, bufnr)
  if client.config.flags then client.config.flags.allow_incremental_sync = true end

  -- Disable document formatting capabilities. We'll use ESLint or Prettier for formatting
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  common_on_attach(client, bufnr)
end

lspconfig.tsserver.setup {
  on_attach = tsserver_on_attach,
  root_dir = lspconfig.util.root_pattern(".git", "tsconfig.json",
                                         "packages.json"),
}
