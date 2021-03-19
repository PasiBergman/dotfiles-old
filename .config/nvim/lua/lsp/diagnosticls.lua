-- ----------------------------------------------------------------------------
-- Diagnostic Language Server configuration
--
-- Requires : npm install -g diagnostic-languageserver
--
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#diagnosticls
-- ----------------------------------------------------------------------------

local lspconfig = require('lspconfig')
local common_on_attach = require('lsp.common').common_on_attach

lspconfig.diagnosticls.setup{
  on_attach = common_on_attach,
  root_dir = lspconfig.util.root_pattern('.git','.eslintrc.js','package.json','tsconfig.json','.stylelintrc.json');
  filetypes={
    'css',
    'javascript',
    'javascriptreact',
    'json',
    'markdown',
    'scss',
    'sh',
    'toml',
    'typescript',
    'typescriptreact',
    'vue',
    'yaml',
    -- 'lua',
  },
  init_options = {
    documentFormatting = true,
    linters = {
      eslint = {
        command = './node_modules/.bin/eslint',
        rootPatterns = {'.git','.eslintrc.js','package.json'},
        debounce = 100,
        args = {
          '--stdin',
          '--stdin-filename',
          '%filepath',
          '--format',
          'json'
        },
        sourceName = 'eslint',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '${message} [${ruleId}]',
          security = 'severity',
        },
        securities = {
          [2] = 'error',
          [1] = 'warning',
        },
      },
      shellcheck = {
        command = "shellcheck",
        debounce = 100,
        args = {"--format", "json", "-"},
        sourceName = "shellcheck",
        parseJson = {
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${code}]",
          security = "level"
        },
        securities = {
          error = "error",
          warning = "warning",
          info = "info",
          style = "hint"
        }
      },
      markdownlint = {
        command = "markdownlint",
        isStderr = true,
        debounce = 100,
        args = {"--stdin"},
        offsetLine = 0,
        offsetColumn = 0,
        sourceName = "markdownlint",
        formatLines = 1,
        formatPattern = {
          "^.*?:\\s?(\\d+)(:(\\d+)?)?\\s(MD\\d{3}\\/[A-Za-z0-9-/]+)\\s(.*)$",
          {
            line = 1,
            column = 3,
            message = {4}
          },
        },
      },
    },
    filetypes = {
      javascripreact= 'eslint',
      javascript = 'eslint',
      markdown = 'markdownlint',
      sh = 'shellcheck',
      typescript = 'eslint',
      typescriptreact = 'eslint',
      vue = 'eslint',
    },
    formatters = {
      prettier = {
        command = "./node_modules/.bin/prettier",
        rootPatterns = {'.git','package.json'},
        args = {
          '--stdin-filepath',
          '%filepath',
        },
      },
      eslint_d = {
        command = 'eslint_d',
        rootPatterns = {'.git','package.json','.eslintrc.js'},
        args = {
          '--fix-to-stdout',
          '--stdin',
          '--stdin-filename=%filepath',
        },
      },
      eslint = {
        command = './node_modules/.bin/eslint',
        rootPatterns = {'.git','package.json','.eslintrc.js'},
        args = {
          '--fix',
          '--stdin',
          '--stdin-filename=%filepath',
        },
      },
      stylelint = {
        command = './node_modules/.bin/stylelint',
        rootPatterns = {'.git','package.json','.stylelintrc.json'},
        args = {
          '--fix',
          '--stdin-filename',
          '%filepath',
        },
      },
      prettierstylelint = {
        command = { 'prettier-stylelint' },
        rootPatterns = {'.git','package.json'},
        args = {
          '--stdin-filepath',
          '%filepath',
          '--write',
        },
      },
      luaformat = {
        command = { 'lua-format' },
        rootPatterns = {'.git','nvim', 'vim.init'},
        args = {
          "-i",
          "--no-keep-simple-function-one-line",
          "--tab-width=2",
          "--no-break-after-operator",
          "--column-limit=100",
          "--break-after-table-lb"
        },
      },
    },
    formatFiletypes = {
      css = 'stylelint',
      javascript = 'eslint_d',
      javascriptreact = 'prettier',
      json = 'prettier',
      markdown = 'prettier',
      scss = 'stylelint',
      sh = 'shfmt',
      toml = 'prettier',
      typescript = 'eslint_d',
      typescriptreact= 'prettier',
      yaml = 'prettier',
      vue = 'eslint_d',
      -- lua = 'luaformat',
    },
  }
}
