let g:grepper = {
            \ 'open': 1,
            \ 'quickfix': 1,
            \ 'searchreg': 1,
            \ 'highlight': 1,
            \ }

" try `gsiw` under word
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
