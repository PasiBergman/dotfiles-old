filetype plugin on                      " Enable filetype based configurations/mappings
set noerrorbells                        " Do not make noise.
" Tabs
set tabstop=4 softtabstop=4             " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set expandtab                           " Converts tabs to spaces
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
" Row numbering
set number                              " Line numbers
set rnu                                 " Show line numbers relative to current line"
" Search
" set smartcase                           " Search case insensitive unless capital letter exists in the search term
set incsearch                           " Match already while typing the search term
" File stuff
set noswapfile
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
if (has("persistent_undo"))
  set undodir=$HOME/.cache/nvim/undodir  " Directory to store undo history
  set undofile
end
set shada=!,'100,n$HOME/.cache/nvim/files/info/viminfo

set iskeyword+=-                        " treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continuation of comments
set nowrap                              " Display long lines as just one line
set whichwrap+=<,>,[,],h,l              " Wrap long line when cursor keys are used.
set hidden                              " Required to keep multiple buffers open multiple buffers
set encoding=utf-8                      " The encoding displayed
set pumheight=20                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set laststatus=2                        " Always display the status line
set cursorline                          " Enable highlighting of the current line
set textwidth=100                       " Specify text width to 100 instead of old 80
set colorcolumn=+1                      " Mark the column textwidth+1
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set scrolloff=8                         " Start screen scrolling when cursor is 8 rows from top/bottom
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes:2                    " Allow 2 signs on the left side of the rownumbers. :help signcolumn
set updatetime=300                      " Faster completion
set timeoutlen=1000                     " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else

set listchars=tab:▸\ ,trail:,precedes:←,extends:→,nbsp:␣  ",eol:↵'
set list

language en_US.UTF-8
set langmenu=en_US.UTF-8
lang en_US.UTF-8
set spelllang=en
autocmd FileType text,markdown setlocal spell
autocmd FileType text,markdown setlocal wrap
autocmd FileType text,markdown setlocal wrap

" Normal mode map ö->[, ä->], Ö->{, Ä->} to make better use of Finnish keyboard layout
set langmap=öäÖÄ;[]{}

" Do not load/use netrw file browser
let loaded_netrwPlugin = 1

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Always show matching parenthesis for (),[],{}
autocmd FileTYpe * DoMatchParen

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

" Flash the yanked content
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Remove line numbers in terminal
autocmd TermOpen * setlocal nonumber norelativenumber
