" https://github.com/tpope/vim-commentary/issues/68
" autocmd FileType apache setlocal commentstring=#\ %s
" let g:context#commentstring#table['typescriptreact'] = {
"       \ 'jsComment' : '// %s',
"       \ 'jsImport' : '// %s',
"       \ 'jsxStatment' : '// %s',
"       \ 'jsxRegion' : '{/*%s*/}',
"       \}
setlocal commentstring={/*%s*/}
