" Configuration for vim-vue plugin

let g:vue_pre_processors = ['scss']

" For scss files, you may need use:
" autocmd FileType scss setl iskeyword+=@-@
autocmd FileType vue setl iskeyword+=@-@
