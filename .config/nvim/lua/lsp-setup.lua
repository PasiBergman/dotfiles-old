local lspconfig = require 'lspconfig'

-- Python language server
-- Community: pip3 install python-language-server
lspconfig.pyls.setup{
  on_attach=require'completion'.on_attach;
}

-- Python language server
-- Microsoft: npm install -g pyright
-- lspconfig.pyright.setup{
--   on_attach=require'completion'.on_attach
-- }

-- TypeScript language server
-- npm install -g typescript typescript-language-server
lspconfig.tsserver.setup{
  on_attach=require'completion'.on_attach;
}

-- Bash language server
-- npm install -g bash-language-server
lspconfig.bashls.setup{
  on_attach=require'completion'.on_attach;
}

-- CSS language server
-- npm install -g vscode-css-languageserver-bin
lspconfig.cssls.setup{
  on_attach=require'completion'.on_attach;
}

-- Vue language server
-- npm install -g vls
lspconfig.vuels.setup{
  on_attach=require'completion'.on_attach;
}

-- Yaml language server
-- npm install -g yaml-language-server
lspconfig.yamlls.setup{
  on_attach=require'completion'.on_attach;
}

-- Html language server
-- npm install -g vscode-html-languageserver-bin
lspconfig.html.setup{
  on_attach=require'completion'.on_attach;
}

-- Json language server
-- npm install -g vscode-json-languageserver
lspconfig.jsonls.setup{
  on_attach=require'completion'.on_attach;
}

-- C# language server
-- Important! OmniSharp.exe must be executable i.e. chmod +x OmniSharp.exe
-- local pid = vim.fn.getpid()
local omnisharp_bin = vim.fn.expand("~/.cache/omnisharp-vim/omnisharp-roslyn/run")
lspconfig.omnisharp.setup{
  on_attach=require'completion'.on_attach;
  cmd = { omnisharp_bin, "--languageserver" };
  -- cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) };
}

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
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { on_attach = on_attach }
end
