" completion-nvim configuration
" https://github.com/nvim-lua/completion-nvim

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Avod showing message extra message when using completion
set shortmess+=c

" Show menu even if only one item
" Do not automatically insert an item
" Do not automatically select an item
set completeopt=menuone,noinsert,noselect

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'UltiSnips'

" Chain complete support
" https://github.com/nvim-lua/completion-nvim/wiki/chain-complete-support
let g:completion_chain_complete_list = {
    \'default' : {
    \   'default' : [
    \        {'complete_items': ['lsp','ts','snippet']},
    \        {'complete_items': ['buffers']},
    \        {'mode': '<c-p>'},
    \        {'mode': '<c-n>'},
    \   ],
    \   'comment' : [],
    \   'string' : []
    \},
    \'vim' : [
    \   {'complete_items' : ['snippet']},
    \   {'mode' : 'cmd'}
    \],
    \'python' : [
    \   {'complete_items' : ['lsp','ts','snippet']},
    \       {'complete_items' : ['buffers']}
    \   ],
    \'lua' : [
    \   {'complete_items' : ['lsp','ts','snippet']},
    \   {'complete_items' : ['buffers']}
    \],
\}
"
" switch to next or previous completion source
imap <c-n> <Plug>(completion_next_source)
imap <c-p> <Plug>(completion_prev_source)

" turn on auto changing sources by
" let g:completion_auto_change_source = 1

" These should be defaults
" let g:completion_enable_auto_popup = 1
" let g:completion_enable_auto_hover = 1
" let g:completion_enable_auto_signature = 1

