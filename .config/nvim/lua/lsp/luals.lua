-- ----------------------------------------------------------------------------
-- Lua Language Server configuration
--
-- Requires : https://github.com/sumneko/lua-language-server
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sumneko_lua
-- ----------------------------------------------------------------------------
local lspconfig = require('lspconfig')
local common_on_attach = require('lsp.common').common_on_attach

local sumneko_root_path = vim.fn.expand('$HOME/.cache/nvim/lua-language-server')
local sumneko_binary = ""
if vim.fn.has("mac") == 1 then
  sumneko_binary = vim.fn.expand('~/.cache/nvim/lua-language-server/bin/macOS/lua-language-server')
elseif vim.fn.has('unix') then
  sumneko_binary = vim.fn.expand('~/.cache/nvim/lua-language-server/bin/Linux/lua-language-server')
else
  print('Unsupported system for sumneko (Lua Language Server).')
end

lspconfig.sumneko_lua.setup {
  on_attach = common_on_attach,
  root_dir = lspconfig.util.root_pattern('.git', 'nvim', 'init.vim', 'lua', 'root.mark'),
  cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        }
      }
    }
  }
}

