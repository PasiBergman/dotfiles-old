let g:startify_custom_header = [
  \ '    _  _                 _        ',
  \ '   | \| | ___  ___ __ __(_) _ __   ',
  \ '   | .  |/ -_)/ _ \\ V /| || "  \  ',
  \ '   |_|\_|\___|\___/ \_/ |_||_|_|_| ',
\ ]

let g:startify_session_dir = '~/.config/nvim/session'

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',                    'header': ['   Files']                        },
        \ { 'type': 'dir',                      'header': ['   Current Directory '. getcwd()] },
        \ { 'type': 'sessions',                 'header': ['   Sessions']                     },
        \ { 'type': 'bookmarks',                'header': ['   Bookmarks']                    },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',                 'header': ['   Commands']       },
        \ ]


let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_bookmarks = [
        \ { 'n': '~/.config/nvim/' },
        \ { 't': '~/.config/tmux/' },
        \ { 'u': '~/Code/Keva/oet-ui/' },
        \ { 'o': '~/Code/Keva/oet-api/' },
        \ { 'm': '~/Code/Keva/Avaintiedot-Massatoimitus/' },
        \ { 'i': '~/Code/Keva/Tyokykypolkuja.Infra/' },
        \ { 'b': '~/Code/Keva/Tyokykypolkuja.WebAPI/' },
        \ { 'w': '~/Code/Keva/Tyokykypolkuja.WebUI/' },
        \ '~/Code/',
        \ '~/Code/Keva',
        \ '~/.config/',
        \ '~/bin/',
        \ '~/.zshrc',
        \ ]

let g:startify_enable_special = 0

" Set shada (vimfile) location
set shada=!,'100,n$HOME/.config/nvim/files/info/viminfo
