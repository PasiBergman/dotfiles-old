" let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
" let g:user_emmet_mode='a'    "enable all function in all mode.

let g:user_emmet_install_global = 0
autocmd FileType html,css,vue,jsx,xhtml EmmetInstall

" Remap the emmet leader key
" let g:user_emmet_leader_key='<C-y>'
