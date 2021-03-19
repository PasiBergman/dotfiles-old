-- ----------------------------------------------------------------------------
-- EFM  Language Server configuration
--
-- Requires: https://github.com/mattn/efm-langserver#installation
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#efm
-- ----------------------------------------------------------------------------
local lspconfig = require('lspconfig')
local common_on_attach = require('lsp.common').common_on_attach

-- Formatting via efm
local eslint = require('lsp.efm.eslint')
local eslint_format = require('lsp.efm.eslint-format')
local lua_format = require('lsp.efm.lua-format')
local prettier = require('lsp.efm.prettier')

local languages = {
  css = {prettier},
  html = {prettier},
  javascript = {prettier, eslint},
  javascriptreact = {prettier, eslint},
  json = {prettier},
  lua = {lua_format},
  markdown = {prettier},
  scss = {prettier},
  typescript = {prettier, eslint},
  typescriptreact = {prettier, eslint},
  vue = {eslint_format, eslint},
  yaml = {prettier}
}

lspconfig.efm.setup {
  on_attach = common_on_attach,
  root_dir = lspconfig.util.root_pattern('.git', 'nvim', 'init.vim', 'package.json', '.eslintrc.js'),
  filetypes = vim.tbl_keys(languages),
  init_options = {documentFormatting = true, codeAction = true},
  settings = {
    languages = languages,
    log_level = 2,
    log_file = '/Users/pbe/.cache/efm-langserver/efm.log'
  }
}
