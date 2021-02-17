" completion-nvim configuration
" https://github.com/nvim-lua/completion-nvim

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Avod showing message extra message when using completion
set shortmess+=ci

"set completeopt=menuone,noinsert,noselect

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'UltiSnips'

" Chain complete support
" https://github.com/nvim-lua/completion-nvim/wiki/chain-complete-support
let g:completion_chain_complete_list = {
    \'default' : {
    \   'default' : [
    \        {'complete_items': ['lsp', 'ts', 'snippet']},
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
    \   {'complete_items' : ['ls','ts','snippet']},
    \   {'complete_items' : ['buffers']}
    \],
\}

