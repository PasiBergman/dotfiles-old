" View differences" Git status
" nmap <Leader>gst :G<CR>


" Checkout 
" nnoremap <leader>gc :GCheckout<CR>
" View differences in 3-way split | | |
nnoremap <leader>gd :Gvdiff<CR>
" or merge conflict resolution. Use 'dv' on the file on fugitive view

" Get the left pane change (from current branch)
nnoremap gdh :diffget //2<CR>
" Get the right pane change (from merge branch)
nnoremap gdl :diffget //3<CR>

" Use the :Gwrite! to use ALL changes from the active bufffer (//2 or //3)

" Jump to next conflict with
" [c
" Jump to previous conflict with
" ]c

" Update the screen after each get
nnoremap <leader>gu :diffupdate<CR>

" After finished, make sure that you are on the center pane/window
" <Ctrl-W>o => "(This) Window only"

" More info
" https://medium.com/prodopsio/solving-git-merge-conflicts-with-vim-c8a8617e3633
" http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/

