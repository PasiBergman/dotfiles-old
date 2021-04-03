" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
endif

if exists('$TMUX')
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
endif

syntax on

" Select colorscheme and background (dark or light)
set background=dark
colorscheme nvcode

hi CursorLine ctermbg=52 guibg=#282828
hi CursorColumn ctermbg=52 guibg=#282828
hi ColorColumn guibg=#282828

" Transparency
" highlight Normal ctermbg=none
" highlight NonText ctermbg=none
" highlight Normal guibg=none
" highlight NonText guibg=non

" Cursorline only visible in the current (active) window
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END


" Diff
hi DiffAdd guibg=none guifg=#608b4e
hi DiffDelete guibg=none guifg=#ff7700
hi DiffChange gui=none guibg=none guifg=#dcdcaa
hi DiffText ctermbg=52 guibg=#FF3000 " #6F1313

" Gitsigns
highlight GitSignsAdd guifg=#4c7e00 guibg=none
highlight GitSignsChange guifg=#007ea0 guibg=none
highlight GitSignsDelete guifg=#ff4400 guibg=none

" Bufferline
highlight BufferLineBufferSelected guibg=#2D323B guifg=#fafafa gui=bold
highlight BufferLineDuplicateSelected guibg=#2D323B guifg=#fafafa gui=bold
highlight BufferLineModifiedSelected guibg=#2D323B guifg=#D49C83 gui=bold
highlight BufferLineErrorSelected guibg=#2D323B guifg=#ff9900
" highlight BufferLineWarningSelected guibg=#2D323B guifg=#ff9900
highlight BufferLineWarningSelected guibg=#2D323B guifg=#fafafa gui=bold
highlight BufferLineIndicatorSelected guibg=#2D323B guifg=#5d4d7a
highlight BufferLineFill guibg=#212121 guifg=#a2a2a2


" Horizontal split separator
highlight StatusLineNC guibg=#282c34
" Vertical split separator
highlight VertSplit guibg=#282c34

" Hop highlights
highlight HopNextKey gui=bold,underline guifg=#00aaff
