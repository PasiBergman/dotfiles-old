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
  " Plug 'tomtom/tcomment_vim'
  Plug 'b3nj5m1n/kommentary'
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
  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
  " Tabline/Bufferline
  Plug 'akinsho/nvim-bufferline.lua'
  " Themes/Colorschemes
  Plug 'christianchiarulli/nvcode-color-schemes.vim'
  Plug 'sainnhe/edge'
  " OmniSharp for C# support for LSP/CoC
  Plug 'OmniSharp/omnisharp-vim'
  " Telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'nvim-telescope/telescope-fzf-writer.nvim'
  " Plug 'nvim-telescope/telescope-vimspector.nvim'
  Plug 'nvim-telescope/telescope-node-modules.nvim'
  Plug 'fhill2/telescope-ultisnips.nvim'
  " Git
  Plug 'tpope/vim-fugitive'
  " Plug 'mhinz/vim-signify'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'junegunn/gv.vim'
  Plug 'rhysd/git-messenger.vim'
  " Start Screen
  Plug 'mhinz/vim-startify'
  " Editor/Source code visualizers
  Plug 'norcalli/nvim-colorizer.lua'
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
  " Plug 'posva/vim-vue'
  " Nvim sets the project root path
  Plug 'airblade/vim-rooter'
  " Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  " Plug 'jvanja/vim-bootstrap4-snippets'

  " Nvim tree
  Plug 'kyazdani42/nvim-tree.lua'
  " Yank highlight
  Plug 'machakann/vim-highlightedyank'
  " Vista
  Plug 'liuchengxu/vista.vim'

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

  " Completion list icons
  Plug 'onsails/lspkind-nvim'

call plug#end()

  " ================================================================
  " Debug Adapter Protocol client implementation for Neovim (>=0.5)
  " https://github.com/mfussenegger/nvim-dap
  " ================================================================
  " Plug 'mfussenegger/nvim-dap'

  " Plug 'Yggdroot/indentLine'

  " Floating window
  " Plug 'voldikss/vim-floaterm'

  " Plug 'nvim-telescope/telescope-z.nvim'

  " Swift - pull in changes to Apple's Sift Vim plugin
  " Plugin 'marcusglowe/vim-swift'

  " HTML/CSS live server
  " Plug 'turbio/bracey.vim'

  " Snippets
  " Plug 'honza/vim-snippets'

  " Cheatsheet (https://cht.sh) integration
  " Plug 'dbeniamine/cheat.sh-vim'
