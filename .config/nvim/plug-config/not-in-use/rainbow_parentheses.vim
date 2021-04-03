" -----------------------------------------------------------------------------
" rainbow_parentheses plugin configuration
"
" https://github.com/junegunn/rainbow_parentheses.vim
" -----------------------------------------------------------------------------
augroup rainbow_lisp
  autocmd!
  autocmd FileType cs,csharp,html,htm,json,yml,yaml,js,javascript,ts,typescript,vue,lua RainbowParentheses
augroup END

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'],['{', '}']]

" List of colors that you do not want. ANSI code or #RRGGBB
" let g:rainbow#blacklist = [233, 234]
