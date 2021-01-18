" View differences" Git status
" nmap <Leader>gst :G<CR>

" View differences
nmap <Leader>gd :Gvdiff<CR>

"Make another dummy change.

" Merge conflict resolution. Use 'dv' on the file on fugitive view
" to start resolving merge conficts.

" For merge conflict resolution. Take the right side change.
nmap <Leader>gf :diffget //2<CR>
" For merge conflict resolution. Take the left side change.
nmap <Leader>gj :diffget //3<CR>
"
