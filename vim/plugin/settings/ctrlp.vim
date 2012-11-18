set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlPMixed<CR>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>

" hide initial nerd tree when opening a file
let g:ctrlp_dont_split = 'NERD_tree_2'