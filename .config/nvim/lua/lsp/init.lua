-- General
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

-- When leaving insert mode => add linting errors to location list.
vim.api.nvim_exec([[
  fun! LspLocationList()
    lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
  endfun

  augroup LSP_Location_List
    autocmd!
    autocmd! InsertLeave * :call LspLocationList()
  augroup END
]], false)

-- Load omnifunc popup icons
require('lsp.lspkind')

-- Load Bash Language Server configuration
require('lsp.bashls')

-- Load CSS Language Server configuration
require('lsp.cssls')

-- Load Dockerfile Language Server configuration
require('lsp.dockerls')

-- Load EFM Language Server configuration
require('lsp.efmls')

-- Load HTML Language Server configuration
require('lsp.html')

-- Load Json Language Server configuration
require('lsp.jsonls')

-- Load Lua Language Server configuration
require('lsp.luals')

-- Load Omnisharp (C#) Language Server configuration
require('lsp.omnisharp')

-- Python Language Server configuration
require('lsp.pyright')

-- SQL Language Server configuration
-- require('lsp.sqlls')

-- Load TypeScript Language Server (tsserver) configuration
require('lsp.tsserver')

-- Load Vim Language Server (vls) configuration
require('lsp.vimls')

-- Load Vue Language Server (vls) configuration
require('lsp.vls')

-- Load Yaml Language Server (yaml) configuration
require('lsp.yaml')

-----------------------------------------------
-- Last but not least - general language server
-----------------------------------------------

