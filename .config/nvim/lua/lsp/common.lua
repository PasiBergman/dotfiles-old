--
-- Common LSP functions
--
local M = {}

M.common_on_attach = function(client, bufnr)

  -- Shortcut functions
  local function buf_map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_opt(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Specify omnifunction complete function name
  buf_opt("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Buffer specific key mappings.
  local opts = { noremap = true, silent = true }
  buf_map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

  buf_map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)

  buf_map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

  buf_map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
          opts)
  buf_map("n", "<leader>wr",
          "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_map("n", "<leader>wl",
          "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
          opts)

  buf_map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

  buf_map("n", "<C-p>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_map("n", "<C-n>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_map("n", "<leader>d",
          "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_map("n", "<leader>ll",
          "<cmd>lua vim.lsp.diagnostic.set_loclist({open_loclist = false})<CR>",
          opts)

  if client.resolved_capabilities.code_action then
    buf_map("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- print("[" .. client.name .. "] Code actions enabled (ga).")
  end

  -- Document formating key binndings if capability exists
  if client.resolved_capabilities.document_formatting then
    buf_map("n", "<leader>p", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    -- print("[" .. client.name .. "] Document formatting capability.")
    -- Format on save
    -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync{}")
  elseif client.resolved_capabilities.document_range_formatting then
    buf_map("n", "<leader>rf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>",
            opts)
    -- print("[" .. client.name .. "] Document range formatting capability.")
    -- Format on save
    -- vim.cmd("autocmd BufWritePre <buffer vim.lsp.buf.range_formatting{}")
  else
    -- print("[" .. client.name .. "] No document formatting capability.")
  end

  -- Sign column icons for diagnostic errors, warnings, info and hints.
  vim.fn.sign_define("LspDiagnosticsSignError", {
    text = "",
    texthl = "LspDiagnosticsSignError",
    linehl = "LspDiagnosticsLineError",
    numhl = "LspDiagnosticsNumError",
  })
  vim.fn.sign_define("LspDiagnosticsSignWarning", {
    text = "𥉉",
    texthl = "LspDiagnosticsSignWarning",
    linehl = "LspDiagnosticsLineWarning",
    numhl = "LspDiagnosticsNumWarning",
  })
  vim.fn.sign_define("LspDiagnosticsSignInformation", {
    text = "",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "LspDiagnosticsLineInformation",
    numhl = "LspDiagnosticsNumInformation",
  })
  vim.fn.sign_define("LspDiagnosticsSignHint", {
    text = "",
    texthl = "LspDiagnosticsSignHint",
    linehl = "LspDiagnosticsLineHint",
    numhl = "LspDiagnosticsNumHint",
  })

  -- Set word/term highlight if capability exists
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END


      hi LspReferenceRead cterm=bold ctermbg=red guibg=#424242
      hi LspReferenceText cterm=bold ctermbg=red guibg=#424242
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#424242
    ]], false)
  end

  -- print(client.name)
  -- print(vim.inspect(client.resolved_capabilities))

end

return M
