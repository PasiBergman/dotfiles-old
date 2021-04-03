" The easiest way to use this plugin is to use one of the following mappings :

" K get answer on the word under the cursor or the selection on a pager (this feature requires vim >= 7.4.1833, you can check if have the right version with : :echo has("patch-7.4.1833"))
" <leader>KK same as K but works on lines or visual selection (not working on neovim, because they killed interactive commands with :!)
" <leader>KB get the answer on a special buffer
" <leader>KR Replace your question by the answer
" <leader>KP Past the answer below your question
" <leader>KC Replay last query, toggling comments
" <leader>KE Send first error to cht.sh
" <leader>C Toggle showing comments by default see configuration
" <leader>KL Replay last query
" The plugins also provides four main commands :

" :Cheat
" :CheatReplace
" :CheatPast
" :CheatPager

let g:CheatSheetFrameworks = {
            \ 'python' : ['python', 'django', ],
            \ 'javascript' : ['javascript', 'node', 'react', 'vue', 'jquery'],
            \}

let g:CheatSheetFrameworkDetectionMethods = {
    \ 'charp' : { 'type' : 'search', 'value': '*.cs' },
    \}
