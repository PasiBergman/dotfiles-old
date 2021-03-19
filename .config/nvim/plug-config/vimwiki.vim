let g:vimwiki_list = [ {'name': 'VimWiki', 'path': '~/VimWiki/', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Programming', 'path': '~/VimWiki/Programming', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Mobile', 'path': '~/VimWiki/Programming/Mobile', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'iOS', 'path': '~/VimWiki/Programming/Mobile/iOS', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'PWA', 'path': '~/VimWiki/Programming/Mobile/PWA', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Server', 'path': '~/VimWiki/Programming/Server', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Csharp', 'path': '~/VimWiki/Programming/Server/Csharp', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'JavaScript', 'path': '~/VimWiki/Programming/Server/Node', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Python', 'path': '~/VimWiki/Programming/Server/Python', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Shell', 'path': '~/VimWiki/Programming/Server/Shell', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Web', 'path': '~/VimWiki/Programming/Web', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Css', 'path': '~/VimWiki/Programming/Web/Css', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'JavaScript', 'path': '~/VimWiki/Programming/Web/JavaScript', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'React', 'path': '~/VimWiki/Programming/Web/React', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Vue', 'path': '~/VimWiki/Programming/Web/Vue', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Computers', 'path': '~/VimWiki/Computers', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'macOS', 'path': '~/VimWiki/Computers/macOS', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Linux', 'path': '~/VimWiki/Computers/Linux', 'syntax': 'markdown', 'ext': '.md'}
            \ , {'name': 'Windows', 'path': '~/VimWiki/Computers/Windows', 'syntax': 'markdown', 'ext': '.md'}
            \ ]

" Do not set md files as filetype=vimwiki globally.
let g:vimwiki_global_ext = 0

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end
