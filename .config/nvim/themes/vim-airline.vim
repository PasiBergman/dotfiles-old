" enable tabline
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''
" let g:airline#extensions#tabline#show_splits = 0
" let g:airline#extensions#tabline#tabs_label = ''

" Disable tabline close button
" let g:airline#extensions#tabline#show_close_button = 1
" let g:airline#extensions#tabline#show_tab_type = 1
" let g:airline#extensions#tabline#show_tab_nr = 1
" let g:airline#extensions#tabline#fnamecollapse = 1

" let g:airline#extensions#tabline#buffers_label = ''
" let g:airline#extensions#tabline#tabs_label = ''
" let g:airline#extensions#coc#enabled = 1
" let g:airline_extensions = ['branch' ] ", 'coc', 'hunks']

" let g:airline#extensions#tabline#fnamemod = '\[%N\]\ %t\ %M'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" enable powerline fonts
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''


" let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z', 'warning', 'error']]
let g:airline_skip_empty_sections = 1

" let g:airline_section_c = airline#section#create([''])
" let g:airline_section_z = airline#section#create(['linenr'])

" Switch to your current theme
let g:airline_theme = 'minimalist'
" let g:airline_theme = 'edge'
" let g:airline_theme = 'base16_google'
" let g:airline_theme = 'base16_default'
" let g:airline_theme = 'nvcode'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" Sections
" let g:airline_section_c = ''
" let g:airline_section_a = " NVCode"
" let g:airline_section_a = ""
" let g:airline_section_y = ''
let g:webdevicons_enable_airline_tabline = 1
