-- ----------------------------------------------------------------------------
-- CSS Language Server configuration
--
-- Requires : https://github.com/OmniSharp/omnisharp-vim
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#omnisharp
-- ----------------------------------------------------------------------------

local lspconfig = require 'lspconfig'
local common_on_attach = require('lsp.common').common_on_attach
-- C# language server
-- Important! OmniSharp.exe must be executable i.e. chmod +x OmniSharp.exe
local pid = vim.fn.getpid()
local omnisharp_bin = vim.fn.expand("~/.cache/omnisharp-vim/omnisharp-roslyn/run")
lspconfig.omnisharp.setup{
  on_attach = common_on_attach,
  cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
}
