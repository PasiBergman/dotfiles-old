" =============================================================================
" init.vim
"
" Based on nvim repository by Christian Chiarulli
" - https://github.com/ChristianChiarulli/nvim
" See also his Blog and YouTube-channel
" - https://www.chrisatmachine.com
" - https://www.youtube.com/channel/UCS98tchJDq17Qms3cux8wcA
" =============================================================================
"
source $HOME/.config/nvim/vim-plug/plugins.vim

" source $HOME/.config/nvim/plug-config/cheat.sh-vim.vim
" source $HOME/.config/nvim/plug-config/easymotion.vim
" source $HOME/.config/nvim/plug-config/fugitive-azure-devops.vim
" source $HOME/.config/nvim/plug-config/gitgutter.vim
" source $HOME/.config/nvim/plug-config/vim-commentary.vim
" source $HOME/.config/nvim/plug-config/vim-illuminate.vim
" source $HOME/.config/nvim/plug-config/vim-vsnip.vim
" source $HOME/.config/nvim/themes/vim-code-dark.vim
" source $HOME/.config/nvim/plug-config/coc/coc-extensions.vim
" source $HOME/.config/nvim/plug-config/coc/coc.vim
" source $HOME/.config/nvim/plug-config/indentLine.vim
" source $HOME/.config/nvim/plug-config/fzf.vim
" source $HOME/.config/nvim/keys/which-key.vim
" luafile $HOME/.config/nvim/lua/nvim-web-devicons-config.lua
" luafile $HOME/.config/nvim/lua/telescope-z-config.lua
" source $HOME/.config/nvim/plug-config/vim-floaterm.vim
" source $HOME/.config/nvim/plug-config/vim-polyglot.vim
" source $HOME/.config/nvim/plug-config/tcomment.vim
" source $HOME/.config/nvim/plug-config/dash.vim

source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim

luafile $HOME/.config/nvim/lua/galaxyline-cfg/init.lua
luafile $HOME/.config/nvim/lua/bufferline-cfg/init.lua

source $HOME/.config/nvim/plug-config/auto-pairs.vim
source $HOME/.config/nvim/plug-config/completion-nvim.vim
source $HOME/.config/nvim/plug-config/emmet.vim
source $HOME/.config/nvim/plug-config/git-messenger.vim
source $HOME/.config/nvim/plug-config/maximizer.vim
source $HOME/.config/nvim/plug-config/nvim-tree.lua.vim
source $HOME/.config/nvim/plug-config/omnisharp.vim
source $HOME/.config/nvim/plug-config/ultisnips.vim
source $HOME/.config/nvim/plug-config/undotree.vim
source $HOME/.config/nvim/plug-config/vim-closetag.vim
source $HOME/.config/nvim/plug-config/vim-fugitive.vim
source $HOME/.config/nvim/plug-config/vim-repeat.vim
source $HOME/.config/nvim/plug-config/vim-rooter.vim
source $HOME/.config/nvim/plug-config/vim-signify.vim
source $HOME/.config/nvim/plug-config/vim-sneak.vim
source $HOME/.config/nvim/plug-config/vim-startify.vim
source $HOME/.config/nvim/plug-config/vim-surround.vim
source $HOME/.config/nvim/plug-config/vimspector.vim
source $HOME/.config/nvim/plug-config/vimwiki.vim

source $HOME/.config/nvim/themes/nvcode-color-schemes.vim
source $HOME/.config/nvim/themes/edge.vim

luafile $HOME/.config/nvim/lua/colorizer-cfg/init.lua
luafile $HOME/.config/nvim/lua/treesitter-cfg/init.lua
luafile $HOME/.config/nvim/lua/telescope-cfg/init.lua
luafile $HOME/.config/nvim/lua/telescope-cfg/node-modules-config.lua
luafile $HOME/.config/nvim/lua/telescope-cfg/fzy-native-config.lua
luafile $HOME/.config/nvim/lua/telescope-cfg/extensions.lua
luafile $HOME/.config/nvim/lua/gitsigns-cfg/init.lua
luafile $HOME/.config/nvim/lua/kommentary-cfg/init.lua

source $HOME/.config/nvim/plug-config/telescope.vim

" -------------------------------
" Initialize language server(s)
" -------------------------------
luafile $HOME/.config/nvim/lua/lsp/init.lua

" Finally our own theme/highlight changes
source $HOME/.config/nvim/themes/general.vim

