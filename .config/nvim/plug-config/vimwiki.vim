let g:vimwiki_list = [ {'name': 'Wiki', 'path': '~/Documents/Wiki/', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Programming', 'path': '~/Documents/Wiki/Programming', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Mobile', 'path': '~/Documents/Wiki/Programming/Mobile', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'iOS', 'path': '~/Documents/Wiki/Programming/Mobile/iOS', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'PWA', 'path': '~/Documents/Wiki/Programming/Mobile/PWA', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Server', 'path': '~/Documents/Wiki/Programming/Server', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Csharp', 'path': '~/Documents/Wiki/Programming/Server/Csharp', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'JavaScript', 'path': '~/Documents/Wiki/Programming/Server/Node', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Python', 'path': '~/Documents/Wiki/Programming/Server/Python', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Shell', 'path': '~/Documents/Wiki/Programming/Server/Shell', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Web', 'path': '~/Documents/Wiki/Programming/Web', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Css', 'path': '~/Documents/Wiki/Programming/Web/Css', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'JavaScript', 'path': '~/Documents/Wiki/Programming/Web/JavaScript', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'React', 'path': '~/Documents/Wiki/Programming/Web/React', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Vue', 'path': '~/Documents/Wiki/Programming/Web/Vue', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Computers', 'path': '~/Documents/Wiki/Computers', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'macOS', 'path': '~/Documents/Wiki/Computers/macOS', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Linux', 'path': '~/Documents/Wiki/Computers/Linux', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Windows', 'path': '~/Documents/Wiki/Computers/Windows', 'syntax': 'markdown', 'ext': '.md'}
            \ ]

" Do not set md files as filetype=vimwiki globally.
let g:vimwiki_global_ext = 0

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end
