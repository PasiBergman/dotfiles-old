" =============================================================================
" init.vim
" =============================================================================
"
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/mappings.vim

" source $HOME/.config/nvim/plug-config/completion-nvim.vim
luafile $HOME/.config/nvim/lua/plugins/nvim-compe/init.lua
source $HOME/.config/nvim/plug-config/emmet.vim
source $HOME/.config/nvim/plug-config/maximizer.vim
source $HOME/.config/nvim/plug-config/nvim-tree.vim
source $HOME/.config/nvim/plug-config/omnisharp.vim
source $HOME/.config/nvim/plug-config/ultisnips.vim
source $HOME/.config/nvim/plug-config/undotree.vim
source $HOME/.config/nvim/plug-config/vim-closetag.vim
source $HOME/.config/nvim/plug-config/vim-fugitive.vim
source $HOME/.config/nvim/plug-config/vim-repeat.vim
source $HOME/.config/nvim/plug-config/vim-rooter.vim
source $HOME/.config/nvim/plug-config/vim-startify.vim
source $HOME/.config/nvim/plug-config/vim-surround.vim
source $HOME/.config/nvim/plug-config/vimspector.vim
source $HOME/.config/nvim/plug-config/vimwiki.vim
source $HOME/.config/nvim/plug-config/vista.vim

source $HOME/.config/nvim/themes/edge.vim
source $HOME/.config/nvim/themes/nvcode-color-schemes.vim

luafile $HOME/.config/nvim/lua/plugins/nvim-web-devicons/init.lua
luafile $HOME/.config/nvim/lua/plugins/barbar-nvim/init.lua
luafile $HOME/.config/nvim/lua/plugins/galaxyline-nvim/init.lua
luafile $HOME/.config/nvim/lua/plugins/nvim-colorizer/init.lua
luafile $HOME/.config/nvim/lua/plugins/nvim-treesitter/init.lua
luafile $HOME/.config/nvim/lua/plugins/telescope-nvim/init.lua
luafile $HOME/.config/nvim/lua/plugins/telescope-nvim/node-modules-config.lua
luafile $HOME/.config/nvim/lua/plugins/telescope-nvim/fzy-native-config.lua
luafile $HOME/.config/nvim/lua/plugins/telescope-nvim/extensions.lua
luafile $HOME/.config/nvim/lua/plugins/gitsigns-nvim/init.lua
luafile $HOME/.config/nvim/lua/plugins/kommentary/init.lua
luafile $HOME/.config/nvim/lua/plugins/hop-nvim/init.lua
luafile $HOME/.config/nvim/lua/plugins/nvim-bqf/init.lua
luafile $HOME/.config/nvim/lua/plugins/lspsaga-nvim/init.lua

" Initialize language server(s)
luafile $HOME/.config/nvim/lua/lsp/init.lua

" Finally our own theme/highlight changes for red-green colorblind
source $HOME/.config/nvim/themes/general.vim
