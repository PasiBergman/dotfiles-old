let g:rooter_silent_chdir = 0

" Which buffers trigger rooter
" ----------------------------
" Everything (default)
" let g:rooter_targets = '/,*'


" How to identify a root directory
" --------------------------------
let g:rooter_patterns = [
    \ '*.sln',
    \ '.git',
    \ '.zshrc',
    \ '^.config',
    \ 'init.lua',
    \ 'init.vim',
    \ 'package.json',
    \ 'src',
    \ ]


let g:rooter_change_directory_for_non_project_files = ''
