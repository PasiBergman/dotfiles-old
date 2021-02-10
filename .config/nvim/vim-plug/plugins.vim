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

 " Easymotion
  " Sneak - easymotion replacement
  Plug 'justinmk/vim-sneak'
  " Surround
  Plug 'tpope/vim-surround'
  " Nvim sets the project root path
  " Plug 'airblade/vim-rooter'
  " vim-sleuth plugin automatically adjusts 'shiftwidth' and 'expandtab'
  " heuristically based on the current file
  Plug 'tpope/vim-sleuth'
  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " Cool Icons
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ryanoasis/vim-devicons'
  " Auto pairs for '(' '[' '{'
  " Plug 'jiangmiao/auto-pairs'
  " Closetags
  Plug 'alvan/vim-closetag'
  " Statusline
  Plug 'vim-airline/vim-airline'
  " Themes
  Plug 'joshdick/onedark.vim'
  Plug 'tomasiser/vim-code-dark'
  Plug 'vim-airline/vim-airline-themes'
  " Plug 'ntk148v/vim-horizon' " Horizon warm dark colorscheme inspired by Visual Studio Code Horizon Theme
  " Plug 'altercation/vim-colors-solarized'
  " Intellisense
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Snippets
  Plug 'honza/vim-snippets'
  " OmniSharp for C# support
  Plug 'OmniSharp/omnisharp-vim'
  " Fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
  Plug 'junegunn/fzf.vim'
  Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/rpc' }
  Plug 'stsewd/fzf-checkout.vim'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-signify'
  Plug 'junegunn/gv.vim'
  Plug 'rhysd/git-messenger.vim'
  " Plug 'tpope/vim-rhubarb' " Gbrowse for github
  " Plug 'cedarbaum/fugitive-azure-devops.vim' "Gbrowse for Azure DevOps
  " Start Screen
  Plug 'mhinz/vim-startify'
  " Color visualizers
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'norcalli/nvim-colorizer.lua'
  " TypeScript syntax (highlighting)
  " Plug 'HerringtonDarkholme/yats.vim'
  Plug 'liuchengxu/vim-which-key'
  " Floating window
  Plug 'voldikss/vim-floaterm'
  " Debugging
  Plug 'puremourning/vimspector'
  Plug 'szw/vim-maximizer'
  " Swift - pull in changes to Apple's Sift Vim plugin
  " Plugin 'marcusglowe/vim-swift'
  " HTML/CSS live server
  " Plug 'turbio/bracey.vim'
  " Vue plugin
  " Plug 'leafOfTree/vim-vue-plugin'
  " Cheatsheet (https://cht.sh) integration
  " Plug 'dbeniamine/cheat.sh-vim'
  " Visualize undo paths/tree
  Plug 'mbbill/undotree'
  Plug 'Yggdroot/indentLine'
  " Vimwiki
  Plug 'vimwiki/vimwiki'


  " Telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'nvim-telescope/telescope-vimspector.nvim'

  " Nvim-Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


  " -------------------------------------
  " Language Server Protocol config (LSP)
  " -------------------------------------
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'

call plug#end()
