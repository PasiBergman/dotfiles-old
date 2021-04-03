" Sort branches/tags by committer date. Minus sign to show in reverse order (recent first)
let g:fzf_checkout_git_options = '--sort=-committerdate'

" Prefix commands with Fzf, i.e, FzfGBranches and FzfGTags
" let g:fzf_command_prefix = ''

" Override the mappings for checkout
" let g:fzf_branch_actions = {
"     \ 'create': {'keymap': 'ctrl-b'},
"     \ 'delete': {'keymap': 'ctrl-d'},
"     \ 'merge': {'keymap': 'ctrl-e'},
"     \ 'rebase': {'keymap': 'ctrl-r'},
" \ }

" Override the mappings for tags
" let g:fzf_tag_actions = {
"     \ 'checkout': {'execute': '!{git} checkout {branch}'}
" \ }

" Define a diff action using fugitive. You can use it with :GBranches diff 
" or with :GBranches and pressing ctrl-f
" let g:fzf_branch_actions = {
"       \ 'diff': {
"       \   'prompt': 'Diff> ',
"       \   'execute': 'Git diff {branch}',
"       \   'multiple': v:false,
"       \   'keymap': 'ctrl-f',
"       \   'required': ['branch'],
"       \   'confirm': v:false,
"       \ },
"       \}

" Define checkout as the only action for branches
" let g:fzf_checkout_merge_settings = v:false
" let g:fzf_branch_actions = {
"       \ 'checkout': {
"       \   'prompt': 'Checkout> ',
"       \   'execute': 'echo system("{git} checkout {branch}")',
"       \   'multiple': v:false,
"       \   'keymap': 'enter',
"       \   'required': ['branch'],
"       \   'confirm': v:false,
"       \ },
"       \}
