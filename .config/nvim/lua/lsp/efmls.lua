-- ----------------------------------------------------------------------------
-- EFM  Language Server configuration
--
-- Requires: https://github.com/mattn/efm-langserver#installation
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#efm
-- ----------------------------------------------------------------------------
local lspconfig = require("lspconfig")
local common_on_attach = require("lsp.common").common_on_attach
local efm_on_attach = function(client, bufnr)
  -- Disable some capabilities
  client.resolved_capabilities.goto_definition = false
  client.resolved_capabilities.code_action = false

  common_on_attach(client, bufnr)
end

-- Formatting and linting via efm
local eslint = require("lsp.efm.eslint")
local lua_format = require("lsp.efm.lua-format")
local eslint_prettier = require("lsp.efm.eslint-prettier")
local prettier = require("lsp.efm.prettier")
local shellcheck = require("lsp.efm.shellcheck")

local languages = {
  css = { prettier },
  html = { prettier },
  javascript = { eslint_prettier, eslint },
  javascriptreact = { eslint_prettier, eslint },
  json = { prettier },
  lua = { lua_format },
  markdown = { prettier },
  scss = { prettier },
  sh = { shellcheck },
  typescript = { eslint_prettier, eslint },
  typescriptreact = { eslint_prettier, eslint },
  vue = { eslint_prettier, eslint },
  yaml = { prettier },
}

lspconfig.efm.setup {
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json",
                                         "vue.config.js", ".eslintrc.js",
                                         ".eslintrc.json", ".git", "root.mark",
                                         "nvim"),
  filetypes = vim.tbl_keys(languages),
  init_options = { documentFormatting = true, codeAction = true },
  settings = { languages = languages, log_level = 1, log_file = "~/efm.log" },
  on_attach = efm_on_attach,
}
