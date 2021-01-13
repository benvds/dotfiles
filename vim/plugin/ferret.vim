" use ripgrep instead of ag
if executable('rg')
  let g:FerretExecutableArguments = {
    \   'rg': '--no-config --vimgrep --no-heading --smart-case --max-columns 4096'
    \ }
endif
