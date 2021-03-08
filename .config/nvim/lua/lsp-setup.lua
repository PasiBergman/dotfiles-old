local lspconfig = require 'lspconfig'

-- Python       : pip3 install python-language-server
-- Python (MS)  : npm install -g pyright
-- TypeScript   : npm install -g typescript typescript-language-server
-- Bash         : npm install -g bash-language-server
-- CSS          : npm install -g vscode-css-languageserver-bin
-- Vue          : npm install -g vls
-- Yaml         : npm install -g yaml-language-server
-- Html         : npm install -g vscode-html-languageserver-bin
-- Json         : npm install -g vscode-json-languageserver

-- Keybindings and completion
-- See ':help lsp' for more details
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    print('[LSP] Document formatting capability.')
    buf_set_keymap("n", "<leader>p", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    -- Format on save
    -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync{}")
  elseif client.resolved_capabilities.document_range_formatting then
    print('[LSP] Range formatting capability.')
    buf_set_keymap("n", "<leader>p", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    -- Format on save
    -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.range_formatting{}")
  end

  vim.fn.sign_define('LspDiagnosticsErrorSign', {text='', texthl='LspDiagnosticsError', linehl='LspDiagnosticsErrorLine', numhl='LspDiagnosticsErrorNum'})
  vim.fn.sign_define('LspDiagnosticsWarningSign', {text='', texthl='LspDiagnosticsWarning', linehl='LspDiagnosticsWarningLine', numhl='LspDiagnosticsWarningNum'})
  vim.fn.sign_define('LspDiagnosticsInformationSign', {text='', texthl='LspDiagnosticsInformation', linehl='LspDiagnosticsInformationLine', numhl='LspDiagnosticsInformationNum'})
  vim.fn.sign_define('LspDiagnosticsHintSign', {text='', texthl='LspDiagnosticsHint', linehl='LspDiagnosticsHintLine', numhl='LspDiagnosticsHintNum'})

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END

      hi LspReferenceRead cterm=bold ctermbg=red guibg=#363630
      hi LspReferenceText cterm=bold ctermbg=red guibg=#363630
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#363630
      hi LspDiagnosticsError guifg=#ff4400 guibg=none
      hi LspDiagnosticsErrorLine guifg=#ff4400 guibg=none
      hi LspDiagnosticsErrorNum guifg=#ff4400 guibg=none
      hi LspDiagnosticsWarning guifg=#674D00 guibg=none
      hi LspDiagnosticsWarningLine guifg=#674D00 guibg=none
      hi LspDiagnosticsWarningNum guifg=#674D00 guibg=none
      hi LspDiagnosticsInformation guifg=#183380 guibg=none
      hi LspDiagnosticsInfomrationLine guifg=#183380 guibg=none
      hi LspDiagnosticsInformationNum guifg=#183380 guibg=none
      hi LspDiagnosticsHint guifg=#484841 guibg=none
      hi LspDiagnosticsHintLine guifg=#484841 guibg=none
      hi LspDiagnosticsHintNum guifg=#484841 guibg=none

      hi LspDiagnosticsVirtualTextError guifg=#ff4400 guibg=none
      hi LspDiagnosticsFloatingError guifg=#ff4400 guibg=#2a2a2a
      hi LspDiagnosticsSignError guifg=#ff4400 guibg=none
      hi LspDiagnosticsDefaultWarning guifg=#ffbc53 guibg=none
      hi LspDiagnosticsVirtualTextWarning guifg=#ffbc53 guibg=none
      hi LspDiagnosticsFloatingWarning guifg=#ffbc53 guibg=#2a2a2a
      hi LspDiagnosticsSignWarning guifg=# guibg=#ffbc53

    ]], false)
  end


end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "pyls", "html", "tsserver", "bashls", "cssls", "yamlls", "jsonls" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
      on_attach = on_attach,
  }
end

--
-- C# language server
-- Important! OmniSharp.exe must be executable i.e. chmod +x OmniSharp.exe
-- local pid = vim.fn.getpid()
local omnisharp_bin = vim.fn.expand("~/.cache/omnisharp-vim/omnisharp-roslyn/run")
lspconfig.omnisharp.setup{
  on_attach = on_attach,
  cmd = { omnisharp_bin, "--languageserver" },
}

-- Vue language server
lspconfig.vuels.setup {
  on_attach = on_attach,
  cmd = { 'vls', '--stdio' },
  root_dir = lspconfig.util.root_pattern('.git','.eslintrc.js','package.json','vue.config.js');
  filetypes = { 'vue' },
  init_options = {
    config = {
      css = {},
      emmet = {},
      html = {
        suggest = {}
      },
      javascript = {
        format = {}
      },
      stylusSupremacy = {},
      typescript = {
        format = {}
      },
      vetur = {
        completion = {
          autoImport = true,
          useScaffoldSnippets = {
            workspace = '(W)',
            user = '(U)',
            vetur = '(V)',
          },
          tagCasing = 'kebab'
        },
        dev = {
          logLevel = 'DEBUG'
        },
        format = {
          defaultFormatter = {
            css = 'prettier',
            html = 'prettier',
            js = 'prettier',
            less = 'prettier',
            postcss = 'prettier',
            pug = 'prettier',
            sass = 'sass-formaatter',
            scss = 'prettier',
            ts = 'prettier',
          },
          defaultFormatterOptions = {},
          enable = true,
          options = {
            tabSize = 2,
          },
          scriptInitialIndent = false,
          styleInitialIndent = false
        },
        languageFeatures = {
          ignoreProjectWarning = false,
          updateImportOnFileMove = true,
        },
        trace = {
          server = 'messages'
        },
        useWorkspaceDependencies = true,
        validation = {
          interpolation = true,
          script = true,
          style = true,
          template = true,
          templateProps = true,
        }
      }
    }
  },
}

-- Diagnostics Language Server
lspconfig.diagnosticls.setup{
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern('.git','.eslintrc.js','package.json','tsconfig.json','.stylelintrc.json');
  cmd = {"diagnostic-languageserver", "--stdio"},
  filetypes={
    'css',
    'javascript',
    'javascriptreact',
    'json',
    'lua',
    'markdown',
    'scss',
    'sh',
    'toml',
    'typescript',
    'typescriptreact',
    'vue',
    'yaml',
  },
  init_options = {
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
    },
    formatFiletypes = {
      css = 'stylelint',
      javascript = 'eslint_d',
      javascriptreact = 'prettier',
      json = 'prettier',
      lua = 'prettier',
      markdown = 'prettier',
      scss = 'stylelint',
      sh = 'shfmt',
      toml = 'prettier',
      typescript = 'eslint_d',
      typescriptreact= 'prettier',
      yaml = 'prettier',
      vue = 'eslint_d',
    },
  }
}

