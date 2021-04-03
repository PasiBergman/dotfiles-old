let g:gitgutter_sign_added                   = '+'
let g:gitgutter_sign_modified                = 'U'
let g:gitgutter_sign_removed                 = '-'
let g:gitgutter_sign_removed_first_line      = '-'
let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed        = '-'

let g:gitgutter_preview_win_floating = 1
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_sign_allow_clobber = 0

highlight GitGutterAdd    guifg=#587C0C ctermfg=2
highlight GitGutterChange guifg=#0C7D9D ctermfg=3
highlight GitGutterDelete guifg=#94151B ctermfg=1
"highlight GitGutterAddLine guifg= ctermfg=           " default: links to DiffAdd
"highlight GitGutterChangeLine guifg= ctermfg=        " default: links to DiffChang
"highlight GitGutterDeleteLine guifg= ctermfg=        " default: links to DiffDelete
"highlight GitGutterChangeDeleteLine guifg= ctermfg=  " default: links to GitGutterChangeLineDefault, i.e. DiffChange
"highlight GitGutterAddLineNr          " default: links to CursorLineNr
"highlight GitGutterChangeLineNr       " default: links to CursorLineNr
"highlight GitGutterDeleteLineNr       " default: links to CursorLineNr
"highlight GitGutterChangeDeleteLineNr " default: links to CursorLineNr
"
" Sample link
" highlight link GitGutterChangeLine DiffText
