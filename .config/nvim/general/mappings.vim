" Basic Key Mappings
"
" imap <C-h> <C-w>h
" imap <C-j> <C-w>j
" imap <C-k> <C-w>k
" imap <C-l> <C-w>l

" g Leader key
let g:mapleader=" "

" let localleader=" "
" nnoremap <Space> <Nop>

" Better indenting
" vnoremap < <gv
" vnoremap > >gv

" Use jj to 'Esc' on insert mode
" inoremap jj <Esc>

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Alternate way to save
" nnoremap <silent> <C-s> :w<CR>
" NOTE! Alacritty configured to send ":w<CR>" with Cmd-S

" Better window navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Window resizing
nnoremap = :resize +5<CR>
nnoremap - :resize -5<CR>
nnoremap <C-[> <silent> 10<C-w><
nnoremap <C-\> <silent> 10<C-w>>

" Terminal window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>

" let g:elite_mode=0                      " Disable arrows"
" Disable arrow movement, resize splits instead.
" if get(g:, 'elite_mode')
"     nnoremap <C-Up>    :resize -2<CR>
"     nnoremap <C-Down>  :resize +2<CR>
"     nnoremap <C-Left>  :vertical resize -2<CR> 
"     nnoremap <C-Right> :vertical resize +2<CR>
" endif

" Use + to go to end of line as $ is more difficult on Finnish keyboard
" ...and 0 is on the left side of + and 0 moves to beginning of the line.
nnoremap + $

" Use F3 and Shift-F3 to browse location list
nnoremap <F3> :lnext<CR>
nnoremap <S-F3> :lprev<CR>
inoremap <F3> <esc>:lnext<CR>
inoremap <S-F3> <esc>:lprev<CR>
" Close Location List
nnoremap <Leader>cll :lclose<CR>

" Use F4 and Shift-F4 to browse quickfix (global) list
nnoremap <F4> :next<CR>
nnoremap <S-F4> :cprev<CR>
inoremap <F4> <esc>:cnext<CR>
inoremap <S-F4> <esc>:cprev<CR>
" Close Quickfix List
nnoremap <Leader>cql :lclose<CR>

" Trim Whitespace
nnoremap tws :%s/\s\+$//<CR>

" Close buffer
nnoremap <C-c> :bd<cr>
inoremap <C-c> <esc>:bd<cr>

" ctrl+h to toggle search highlight.
let hlstate=0
" nnoremap <c-h> <silent> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" function s:OpenFinderCwd()
"     let currentPath = getcwd()
"     execute "!open " . currentPath
" endfunction

if has('mac')
  " Open macOS finder in the current working directory
  nnoremap <leader>oF :!open %:h<cr>
  " Open current file with default application
  nnoremap <leader>of :!open %<cr>
else
  " Open current working directory in Linux
  nnoremap <leader>oF :!xdg-open %:h<cr>
  " Open current file with default Linux application
  nnoremap <leader>of :!xdg-open %<cr>
endif

" Terminal
nnoremap <C-t> :terminal<CR>

" Sort
vnoremap <leader>s :sort<CR>

" Auto pairs
imap "" ""<Esc>i
imap '' ''<Esc>i
imap (( ()<Esc>i
imap \[\[ \[\]<Esc>i
imap {{ {}<Esc>i

" Generate UUID
nnoremap <leader>id :read !uuidgen<esc>k :join<esc>

" Make F1 as an extra esc key instead of help.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>


