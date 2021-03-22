" let g:startify_custom_header = [
"   \ '    _  _                 _        ',
"   \ '   | \| | ___  ___ __ __(_) _ __   ',
"   \ '   | .  |/ -_)/ _ \\ V /| || "  \  ',
"   \ '   |_|\_|\___|\___/ \_/ |_||_|_|_| ',
" \ ]

let g:startify_custom_header = 'startify#pad(startify#fortune#cowsay())'


" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:Startify_gitBranchName()
    let branchName = system('git rev-parse --abbrev-ref HEAD 2>/dev/null')
    return branchName
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'dir',                      'header': ['   Current Directory '. getcwd()] },
        \ { 'type': function('s:gitModified'),  'header': ['   Git modified']                 },
        \ { 'type': function('s:gitUntracked'), 'header': ['   Git untracked']                },
        \ { 'type': 'files',                    'header': ['   Files']                        },
        \ { 'type': 'sessions',                 'header': ['   Sessions']                     },
        \ { 'type': 'bookmarks',                'header': ['   Bookmarks']                    },
        \ { 'type': 'commands',                 'header': ['   Commands']                     },
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

" let g:startify_bookmarks = [
"         \ { 'n': '~/.config/nvim/' },
"         \ { 't': '~/.config/tmux/' },
"         \ { 'u': '~/Code/Keva/oet-ui/' },
"         \ { 'o': '~/Code/Keva/oet-api/' },
"         \ { 'm': '~/Code/Keva/Avaintiedot-Massatoimitus/' },
"         \ { 'i': '~/Code/Keva/Tyokykypolkuja.Infra/' },
"         \ { 'b': '~/Code/Keva/Tyokykypolkuja.WebAPI/' },
"         \ { 'w': '~/Code/Keva/Tyokykypolkuja.WebUI/' },
"         \ '~/Code/',
"         \ '~/Code/Keva',
"         \ '~/.config/',
"         \ '~/bin/',
"         \ '~/.zshrc',
"         \ ]

let g:startify_enable_special = 0

" Set Startify sesssion directory
let g:startify_session_dir = '~/.cache/nvim/session/'

" Set shada (vimfile) location
" set shada=!,'100,n$HOME/.cache/nvim/files/info/viminfo

" Keyboard shortcut
nnoremap <F2> :Startify<cr>
inoremap <F2> <esc>:Startify<cr>


" Auto-save a session named from Git branch
" This will save a unique session with the Git branch name, overwriting the session if
" the branch already exists. If not in a Git project, the session will be saved as "no-project".
function! GetUniqueSessionName()
  let path = fnamemodify(getcwd(), ':p:h')
  " .config path is special case
  if stridx(path, '.config') >= 0
    let path = 'config'
  else
    let path = fnamemodify(getcwd(), ':~:t')
  endif
  let path = empty(path) ? 'no-project' : path
  let branch = s:Startify_gitBranchName()
  let branch = empty(branch) ? '' : '_' . branch
  return substitute(path . branch, '/', '-', 'g')
endfunction

autocmd VimLeavePre * silent execute 'SSave! ' . GetUniqueSessionName()
