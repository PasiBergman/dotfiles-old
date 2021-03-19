-- ----------------------------------------------------------------------------
-- EFM  Language Server configuration
--
-- Requires: https://github.com/mattn/efm-langserver#installation
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#efm
-- ----------------------------------------------------------------------------
local lspconfig = require("lspconfig")
local common_on_attach = require("lsp.common").common_on_attach

-- Formatting via efm
local eslint = require("lsp.efm.eslint")
local eslint_format = require("lsp.efm.eslint-format")
local lua_format = require("lsp.efm.lua-format")
local prettier = require("lsp.efm.prettier")
local shellcheck = require("lsp.efm.shellcheck")

local languages = {
  css = { prettier },
  html = { prettier },
  javascript = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  json = { prettier },
  lua = { lua_format },
  markdown = { prettier },
  scss = { prettier },
  sh = { shellcheck },
  typescript = { eslint_format, eslint },
  typescriptreact = { prettier, eslint },
  vue = { eslint_format, eslint },
  yaml = { prettier },
}

lspconfig.efm.setup {
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json",
                                         "vue.config.js", ".eslintrc.js",
                                         ".git", "root.mark", "lua", "nvim"),
  filetypes = vim.tbl_keys(languages),
  init_options = { documentFormatting = true, codeAction = true },
  settings = { languages = languages, log_level = 1, log_file = "~/efm.log" },
  on_attach = common_on_attach,
}
