" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  " Closetags
  Plug 'alvan/vim-closetag'
  " Code commenting
  Plug 'b3nj5m1n/kommentary'
  " Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  " Remap . so that plugins can tap into it
  Plug 'tpope/vim-repeat'
  " Nvim (lua) easymotion replacement
  Plug 'phaazon/hop.nvim'
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
  Plug 'romgrk/barbar.nvim'
  " Themes/Colorschemes
  Plug 'christianchiarulli/nvcode-color-schemes.vim'
  Plug 'sainnhe/edge'
  " OmniSharp for C# support (and installation)
  Plug 'OmniSharp/omnisharp-vim'
  " Telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'nvim-telescope/telescope-fzf-writer.nvim'
  Plug 'nvim-telescope/telescope-node-modules.nvim'
  " Plug 'nvim-telescope/telescope-vimspector.nvim'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'lewis6991/gitsigns.nvim'
  " Start Screen
  Plug 'mhinz/vim-startify'
  " Editor/Source code visualizers
  Plug 'norcalli/nvim-colorizer.lua'
  " Debugging
  Plug 'puremourning/vimspector'
  Plug 'szw/vim-maximizer'
  " Better Quickfix window
  Plug 'kevinhwang91/nvim-bqf'
  " Visualize undo paths/tree
  Plug 'mbbill/undotree'
  " Vimwiki
  Plug 'vimwiki/vimwiki'
  " Nvim sets the project root path
  Plug 'airblade/vim-rooter'
  " Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'fhill2/telescope-ultisnips.nvim'
  " Nvim tree
  Plug 'kyazdani42/nvim-tree.lua'
  " Vista
  Plug 'liuchengxu/vista.vim'
  " Nvim-Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " Language Server Protocol config (LSP)
  Plug 'neovim/nvim-lspconfig'
  " Completion
  " Plug 'nvim-lua/completion-nvim'
  " Plug 'steelsojka/completion-buffers'
  " Plug 'nvim-treesitter/completion-treesitter'
  " Plug 'onsails/lspkind-nvim'
  Plug 'hrsh7th/nvim-compe'

call plug#end()

  " ================================================================
  " Debug Adapter Protocol client implementation for Neovim (>=0.5)
  " https://github.com/mfussenegger/nvim-dap
  " ================================================================
  " Plug 'mfussenegger/nvim-dap'

  " Vue plugin
  " Plug 'posva/vim-vue'

  " macOS plugins
  " if has("mac")
    " Dash macOS app integration
    " Plug 'rizzatti/dash.vim'
  " endif

  " Floating window
  " Plug 'voldikss/vim-floaterm'

  " Plug 'nvim-telescope/telescope-z.nvim'

  " HTML/CSS live server
  " Plug 'turbio/bracey.vim'

  " Cheatsheet (https://cht.sh) integration
  " Plug 'dbeniamine/cheat.sh-vim'

  " Emacs-like Which key. Leader keybinding helper
  " Plug 'liuchengxu/vim-which-key'
