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
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
     buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<C-p>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<C-n>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.diagnostic.set_loclist({open_loclist = false})<CR>', opts)

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

  vim.fn.sign_define('LspDiagnosticsSignError', {text='', texthl='LspDiagnosticsSignError', linehl='LspDiagnosticsLineError', numhl='LspDiagnosticsNumError'})
  vim.fn.sign_define('LspDiagnosticsSignWarning', {text='', texthl='LspDiagnosticsSignWarning', linehl='LspDiagnosticsLineWarning', numhl='LspDiagnosticsNumWarning'})
  vim.fn.sign_define('LspDiagnosticsSignInformation', {text='', texthl='LspDiagnosticsSignInformation', linehl='LspDiagnosticsLineInformation', numhl='LspDiagnosticsNumInformation'})
  vim.fn.sign_define('LspDiagnosticsSignHint', {text='', texthl='LspDiagnosticsSignHint', linehl='LspDiagnosticsLineHint', numhl='LspDiagnosticsNumHint'})


  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END


      " hi LspReferenceRead cterm=bold ctermbg=red guibg=#363630
      " hi LspReferenceText cterm=bold ctermbg=red guibg=#363630
      " hi LspReferenceWrite cterm=bold ctermbg=red guibg=#363630
    ]], false)
  end

  vim.api.nvim_exec([[
    hi LspDiagnosticsSignError guifg=#aa3300 guibg=none
    hi LspDiagnosticsSignWarning guifg=#BF9345 guibg=none
    hi LspDiagnosticsSignInformation guifg=#193BBF guibg=none
    hi LspDiagnosticsSignHint guifg=#7F7F20 guibg=none

    hi LspDiagnosticsUnderlineError gui=undercurl
    hi LspDiagnosticsUnderlineWarning gui=undercurl
    hi LspDiagnosticsUnderlineInformation gui=undercurl
    " hi LspDiagnosticsUnderlineHint gui=undercurl

    hi LspDiagnosticsVirtualTextError guifg=#ff4400 guibg=none
    hi LspDiagnosticsVirtualTextWarning guifg=#ffbc53 guibg=none
    hi LspDiagnosticsVirtualTextInformation guifg=#193BBF guibg=none
    hi LspDiagnosticsVirtualTextHint guifg=#787878 guibg=none

    hi LspDiagnosticsFloatingError guifg=#ff4400 guibg=#3f3f3f
    hi LspDiagnosticsFloatingWarning guifg=#674D00 guibg=#3f3f3f
    hi LspDiagnosticsFloatingInformation guifg=#183380 guibg=#3f3f3f
    hi LspDiagnosticsFloatingHint guifg=#484841 guibg=#3f3f3f

    " Format on save
    " autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
    " autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
    " autocmd BufWritePre *.vue lua vim.lsp.buf.formatting_sync(nil, 100)
    " autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 100)
    " autocmd BufWritePre *.css lua vim.lsp.buf.formatting_sync(nil, 100)

  ]], false)

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
  on_attach = on_attach,
  cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
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
        library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
      },
    },
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
    },
  }
}

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

require('lspkind').init({
    with_text = true,
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})


-- When opening or saving file, or leaving insert mode => add linting errors to location list.
vim.api.nvim_exec([[
  fun! LspLocationList()
    lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
  endfun

  augroup LSP_Location_List
    autocmd!
    autocmd! BufWrite,BufEnter,InsertLeave * :call LspLocationList()
  augroup END
]], false)

