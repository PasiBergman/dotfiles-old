" Telescope.nvim
" https://github.com/nvim-telescope/telescope.nvim

" Using lua functions
"
" File pickers
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fi <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fF <cmd>lua require('telescope.builtin').file_browser()<cr>

" Vim pickers
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>vf <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>vc <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap <leader>vh <cmd>lua require('telescope.builtin').command_history()<cr>
nnoremap <leader>mp <cmd>lua require('telescope.builtin').man_pages()<cr>
nnoremap <leader>vm <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <leader>vC <cmd>lua require('telescope.builtin').colorscheme()<cr>
nnoremap <leader>q <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <leader>vl <cmd>lua require('telescope.builtin').loclist()<cr>
nnoremap <leader>vo <cmd>lua require('telescope.builtin').vim_options()<cr>
nnoremap <leader>vr <cmd>lua require('telescope.builtin').registers()<cr>
nnoremap <leader>va <cmd>lua require('telescope.builtin').autocommands()<cr>
nnoremap <leader>vs <cmd>lua require('telescope.builtin').spell_suggest()<cr>
nnoremap <leader>vk <cmd>lua require('telescope.builtin').keymaps()<cr>
nnoremap <leader>vt <cmd>lua require('telescope.builtin').filetypes()<cr>
nnoremap <leader>vH <cmd>lua require('telescope.builtin').highlights()<cr>
nnoremap <leader>vz <cmd>lua require('telescope.builtin').current_buffer_fuzzy_lines()<cr>

" LSP Pickers
nnoremap <leader>lr <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>lds <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap <leader>lws <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>
nnoremap <leader>lca <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>
nnoremap <leader>lrca <cmd>lua require('telescope.builtin').lsp_range_code_actions()<cr>

" Git Pickers
nnoremap <leader>ic <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>iC <cmd>lua require('telescope.builtin').git_bcommits()<cr>
nnoremap <leader>ib <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>is <cmd>lua require('telescope.builtin').git_status()<cr>

" Treesitter Picker
nnoremap <leader>tt <cmd>lua require('telescope.builtin').treesitter()<cr>

" Custom searches
nnoremap <Leader>fc <cmd>lua require('ts.extensions').search_dotfiles()<cr>
