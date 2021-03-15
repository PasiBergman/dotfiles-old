let g:nvim_tree_side = 'left'
let g:nvim_tree_width = 36
let g:nvim_tree_ignore = ['.git', 'node_modules', '.cache']
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_auto_ignore_ft = ['startify'] " empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
" let g:nvim_tree_disable_netrw = 1 "1 by default, disables netrw
" let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
" let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
" let g:nvim_tree_show_icons = {
"     \ 'git': 1,
"     \ 'folders': 1,
"     \ 'files': 1,
"     \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath

" You can edit keybindings be defining this variable
" You don't have to define all keys.
" NOTE: the 'edit' key will wrap/unwrap a folder and open a file
" let g:nvim_tree_bindings = {
"     \ " Move to above directory <CR> or 'o' on ..
"     \ 'edit':            ['<CR>', 'o'],
"     \ 'cd':              '<C-]>',
"     \ 'create':          'a', " Create directorie(s) by ending with /
"     \ 'rename':          'r',
"     \ 'rename_omit':     '<C-r>', " Do not write current fileneme to the input
"     \ 'close_node':      '<BS>',
"     \ 'edit_vsplit':     '<C-v>',
"     \ 'edit_split':      '<C-x>',
"     \ 'edit_tab':        '<C-t>',
"     \ 'toggle_ignored':  'I',
"     \ 'toggle_dotfiles': 'H',
"     \ 'refresh':         'R',
"     \ 'preview':         '<Tab>',
"     \ 'remove':          'df',
"     \ 'cut':             'dd',
"     \ 'copy':            'yy',
"     \ 'paste':           'p',
"     \ 'prev_git_item':   '[c',
"     \ 'next_git_item':   ']c',
"     \ 'dir_up':          '-',
"     \ 'close':           'q',
"     \ }
"

" Disable default mappings by plugin
" Bindings are enable by default, disabled on any non-zero value
" let nvim_tree_disable_keybindings=1

" default will show icon by default if no icon is provided
" default shows no icon by default '✗',
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged':  '', 
    \   'staged': '',
    \   'unmerged': '',
    \   'renamed': '',
    \   'untracked': ''
    \   },
    \ 'folder': {
    \   'default': '',
    \   'open': '',
    \   'empty': '',
    \   'empty_open': '',
    \   'symlink': '',
    \   }
    \ }
"
nnoremap <C-e> :NvimTreeToggle<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them

" set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=blue
