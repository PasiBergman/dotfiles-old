" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  " Easier comments
  Plug 'tomtom/tcomment_vim'

  " Remap . so that plugins can tap into it
  Plug 'tpope/vim-repeat'

 " Easymotion replacement
  Plug 'justinmk/vim-sneak'

  " Surround
  Plug 'tpope/vim-surround'

  " vim-sleuth plugin automatically adjusts 'shiftwidth' and 'expandtab'
  " heuristically based on the current file
  Plug 'tpope/vim-sleuth'
  " Editorconfig reads .editorconfig file and adjusts tabs etc.
  Plug 'editorconfig/editorconfig-vim'

  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'

  " Icons
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ryanoasis/vim-devicons'

  " Closetags
  Plug 'alvan/vim-closetag'

  " Statusline
  Plug 'vim-airline/vim-airline'

  " Themes/Colorschemes
  Plug 'joshdick/onedark.vim'
  Plug 'tomasiser/vim-code-dark'
  Plug 'vim-airline/vim-airline-themes'


  " CoC
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Snippets
  Plug 'honza/vim-snippets'

  " OmniSharp for C# support for LSP/CoC
  Plug 'OmniSharp/omnisharp-vim'

  " Fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
  Plug 'junegunn/fzf.vim'
  Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/rpc' }
  Plug 'stsewd/fzf-checkout.vim'


  " Telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'nvim-telescope/telescope-vimspector.nvim'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-signify'
  Plug 'junegunn/gv.vim'
  Plug 'rhysd/git-messenger.vim'

  " Start Screen
  Plug 'mhinz/vim-startify'

  " Editor/Source code visualizers
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'Yggdroot/indentLine'

  " Emacs-like Which key. Leader keybinding helper
  Plug 'liuchengxu/vim-which-key'

  " Floating window
  Plug 'voldikss/vim-floaterm'

  " Debugging
  Plug 'puremourning/vimspector'
  Plug 'szw/vim-maximizer'

  " Visualize undo paths/tree
  Plug 'mbbill/undotree'

  " Vimwiki
  Plug 'vimwiki/vimwiki'

  " Nvim sets the project root path
  " Plug 'airblade/vim-rooter'

  " Auto pairs for '(' '[' '{'
  " Plug 'jiangmiao/auto-pairs'

  " TypeScript syntax (highlighting)
  " Plug 'HerringtonDarkholme/yats.vim'

  " Swift - pull in changes to Apple's Sift Vim plugin
  " Plugin 'marcusglowe/vim-swift'

  " HTML/CSS live server
  " Plug 'turbio/bracey.vim'

  " Vue plugin
  " Plug 'leafOfTree/vim-vue-plugin'

  " Cheatsheet (https://cht.sh) integration
  " Plug 'dbeniamine/cheat.sh-vim'

  " -------------------------------------
  " Nvim-Treesitter
  " -------------------------------------
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " -------------------------------------
  " Language Server Protocol config (LSP)
  " -------------------------------------
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'

call plug#end()
