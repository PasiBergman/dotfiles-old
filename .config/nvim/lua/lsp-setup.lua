local lspconfig = require 'lspconfig'

-- Python       : pip3 install python-language-server
-- Python (MS)  : npm install -g pyright
-- Bash         : npm install -g bash-language-server
-- CSS          : npm install -g vscode-css-languageserver-bin
-- Yaml         : npm install -g yaml-language-server
-- Html         : npm install -g vscode-html-languageserver-bin
-- Json         : npm install -g vscode-json-languageserver

-- Keybindings and completion
-- See ':help lsp' for more details


-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {"yamlls", "jsonls" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
      on_attach = on_attach,
  }
end

--


-- Diagnostics Language Server

-- lspconfig.efm.setup {
--   on_attach = on_attach,
--   init_options = {
--     documentFormatting = true
--   },
--   filetypes = {'lua'},
--   settings = {
--     rootMarkers = {'.git/','init.vim','init.lua'},
--     languages = {
--       lua = {
--         {
--           -- formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
--           formatCommand = 'lua-format -i',
--           formatStdin = true,
--         },
--       },
--     },
--   },
-- }



