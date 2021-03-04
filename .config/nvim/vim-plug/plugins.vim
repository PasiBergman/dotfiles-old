" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  " Auto pairs for '(' '[' '{' etc.
   Plug 'jiangmiao/auto-pairs'
  " Closetags
  Plug 'alvan/vim-closetag'
  " Easier comments
  Plug 'tomtom/tcomment_vim'
  " Remap . so that plugins can tap into it
  Plug 'tpope/vim-repeat'
 " Easymotion replacement
  Plug 'justinmk/vim-sneak'
  " Emmet for html
  Plug 'mattn/emmet-vim'
  " Surround
  Plug 'tpope/vim-surround'
  " vim-sleuth plugin automatically adjusts 'shiftwidth' and 'expandtab'
  Plug 'tpope/vim-sleuth'
  " Editorconfig reads .editorconfig file and adjusts tabs etc.
  Plug 'editorconfig/editorconfig-vim'
  " Icons
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'
  " Statusline
  Plug 'vim-airline/vim-airline'
  " Themes/Colorschemes
  " Plug 'joshdick/onedark.vim'
  " Plug 'tomasiser/vim-code-dark'
  Plug 'christianchiarulli/nvcode-color-schemes.vim'
  Plug 'vim-airline/vim-airline-themes'
  " CoC
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
  " Plug 'nvim-telescope/telescope-vimspector.nvim'
  Plug 'nvim-telescope/telescope-node-modules.nvim'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-signify'
  Plug 'junegunn/gv.vim'
  Plug 'rhysd/git-messenger.vim'
  " Start Screen
  Plug 'mhinz/vim-startify'
  " Editor/Source code visualizers
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'Yggdroot/indentLine'
  " Emacs-like Which key. Leader keybinding helper
  Plug 'liuchengxu/vim-which-key'
  " Debugging
  Plug 'puremourning/vimspector'
  Plug 'szw/vim-maximizer'
  " Visualize undo paths/tree
  Plug 'mbbill/undotree'
  " Vimwiki
  Plug 'vimwiki/vimwiki'
  " Vue plugin
  Plug 'posva/vim-vue'
  " Nvim sets the project root path
  Plug 'airblade/vim-rooter'
  " Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  " Plug 'jvanja/vim-bootstrap4-snippets'

  " -------------------------------------
  " Nvim-Treesitter
  " -------------------------------------
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " -------------------------------------
  " Language Server Protocol config (LSP)
  " -------------------------------------
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'steelsojka/completion-buffers'
  Plug 'nvim-treesitter/completion-treesitter'
  " macOS plugins
  if has("mac")
    " Dash macOS app integration
    Plug 'rizzatti/dash.vim'
  endif


call plug#end()

  " ================================================================
  " Debug Adapter Protocol client implementation for Neovim (>=0.5)
  " https://github.com/mfussenegger/nvim-dap
  " ================================================================
  " Plug 'mfussenegger/nvim-dap'

  " Floating window
  " Plug 'voldikss/vim-floaterm'

  " Plug 'nvim-telescope/telescope-z.nvim'

  " Nvim tree
  " Plug 'kyazdani42/nvim-tree.lua'

  " Better Syntax Support
  " Plug 'sheerun/vim-polyglot'

  " TypeScript syntax (highlighting)
  " Plug 'HerringtonDarkholme/yats.vim'

  " Swift - pull in changes to Apple's Sift Vim plugin
  " Plugin 'marcusglowe/vim-swift'

  " HTML/CSS live server
  " Plug 'turbio/bracey.vim'

  " Snippets
  " Plug 'honza/vim-snippets'


  " Cheatsheet (https://cht.sh) integration
  " Plug 'dbeniamine/cheat.sh-vim'
