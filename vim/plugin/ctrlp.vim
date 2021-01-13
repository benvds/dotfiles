nnoremap <silent> <C-n> :CtrlPMRU<CR>

" TODO: hide initial nerd tree when opening a file
let g:ctrlp_dont_split = 'NERD_tree_1'
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix\|vimfiler\|NERD\|NERD_tree_1\|NERD_tree_2'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$' }

let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
    \ },
    \ 'fallback': 'find %s -type f'
\ }

if executable('rg')
  let g:ctrlp_user_command = 'rg --files --smart-case %s'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_switch_buffer = 'et'
endif
