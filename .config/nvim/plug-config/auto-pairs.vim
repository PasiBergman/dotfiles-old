" Auto-pairs configuration
" https://github.com/jiangmiao/auto-pairs
"
" Default key bindins/shortcuts
"     <CR>  : Insert new indented line after return if cursor in blank brackets or quotes.
"     <BS>  : Delete brackets in pair
"     <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle)
"     <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap)
"     <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump)
"     <M-b> : BackInsert (g:AutoPairsShortcutBackInsert)
"
" If <M-p> <M-e> or <M-n> conflict with another keys or want to bind to another keys, add
" let g:AutoPairsShortcutToggle = '<another key>'

let g:AutoPairs =  {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
let g:AutoPairsShortcutToggle = 'ÅÅ'
let g:AutoPairsShortcutFastWrap = 'åå'
let g:AutoPairsShortcutJump = '<C-l>'
let g:AutoPairsMapBS = 1
let g:AutoPairsMapCh = 1
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<S-BS>'
