 " This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1

" iTerm2 key bindings makes Command-p as ' ==' (i.e. <Leader>==)
nmap <Leader>== :Files<CR>
nmap <C-p> :GFiles<CR>
nmap <leader>g :Rg<CR>
nmap <leader>fm :Marks<CR>

nnoremap <silent> <Leader>fp     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> <Leader>fgs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> <Leader>fga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> <Leader>fb     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> <Leader>fB     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> <Leader>fo     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> <Leader>f<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> <Leader>fg;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> <Leader>f/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> <Leader>f*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          <Leader>fgr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          <Leader>fgr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> <Leader>ft     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> <Leader>fq     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> <Leader>fl     :<C-u>CocCommand fzf-preview.LocationList<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.9, 'height': 0.9,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info '
" let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!*node_modules*' --glob '!.git/*}'"
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!node_modules' --glob '!.git' --glob '!.msbuild' --glob '!autoload' --glob '!*.dll' --glob '!*.pdb' --glob '!*.exe'"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)


" Get text in files with Rg
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   "rg --column --line-number --no-heading --color=always --smart-case --glob '!.git/**' ".shellescape(<q-args>), 1,

 " Make Ripgrep ONLY search file contents and not filenames
 " Exclude node_modules autoload coc .git ..."
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --smart-case --no-heading --glob "!node_modules" --glob "!.git/" --glob "!autoload" --glob "!/coc/data/" --glob "!/coc/extensions" --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
  \   <bang>0)


" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

augroup fzf_preview
  autocmd!
  autocmd User fzf_preview#rpc#initialized call s:fzf_preview_settings() " fzf_preview#remote#initialized or fzf_preview#coc#initialized
augroup END

function! s:fzf_preview_settings() abort
  let g:fzf_preview_command = 'COLORTERM=truecolor ' . g:fzf_preview_command
  let g:fzf_preview_grep_preview_cmd = 'COLORTERM=truecolor ' . g:fzf_preview_grep_preview_cmd
endfunction
