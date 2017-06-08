" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'editorconfig/editorconfig-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'mileszs/ack.vim'
Plug 'Shougo/neocomplcache'
Plug 'Shougo/neosnippet'
Plug 'honza/vim-snippets'
Plug 'tomtom/tcomment_vim'
" Plug 'airblade/vim-gitgutter' " makes vim slow
Plug 'sjl/gundo.vim'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'


" Writing
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }

" Initialize plugin system
call plug#end()

let g:netrw_banner = 0

" Ctrl-P

nnoremap <silent> <C-b> :CtrlPMRU<CR>
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix\|vimfiler'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$' }

let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'find %s -type f'
\ }


 " neocomplcache

 let g:acp_enableAtStartup = 0
 let g:neocomplcache_enable_at_startup = 1
 let g:neocomplcache_enable_camel_case_completion = 1
 let g:neocomplcache_enable_smart_case = 1
 let g:neocomplcache_enable_underbar_completion = 1
 let g:neocomplcache_enable_auto_delimiter = 1
 let g:neocomplcache_max_list = 15
 let g:neocomplcache_force_overwrite_completefunc = 1

 " SuperTab like snippets behavior.
 imap <silent><expr><TAB> neosnippet#expandable() ?
             \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
             \ "\<C-e>" : "\<TAB>")
 smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

 " Define dictionary.
 let g:neocomplcache_dictionary_filetype_lists = {
             \ 'default' : '',
             \ 'vimshell' : $HOME.'/.vimshell_hist',
             \ 'scheme' : $HOME.'/.gosh_completions'
             \ }

 " Define keyword.
 if !exists('g:neocomplcache_keyword_patterns')
     let g:neocomplcache_keyword_patterns = {}
 endif
 let g:neocomplcache_keyword_patterns._ = '\h\w*'

 if !(exists('g:neocomplcache_same_filetype_lists'))
    let g:neocomplcache_same_filetype_lists = {}
 endif
 let g:neocomplcache_same_filetype_lists.erb = 'html,eruby,ruby'
 let g:neocomplcache_same_filetype_lists.eruby = 'html,erb,ruby'

 " Plugin key-mappings.

 " These two lines conflict with the default digraph mapping of <C-K>
 " If you prefer that functionality, add
 imap <C-k> <Plug>(neosnippet_expand_or_jump)
 smap <C-k> <Plug>(neosnippet_expand_or_jump)

 inoremap <expr><C-g> neocomplcache#undo_completion()
 inoremap <expr><C-l> neocomplcache#complete_common_string()
 inoremap <expr><CR> neocomplcache#complete_common_string()

 inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
 inoremap <expr><C-y> neocomplcache#close_popup()

 " Enable omni completion.
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
 autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
 autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
 autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete ts=2 sw=2

 " Enable heavy omni completion.
 if !exists('g:neocomplcache_omni_patterns')
     let g:neocomplcache_omni_patterns = {}
 endif

 let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
 let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
 let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
 let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
 let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

 " Use honza's snippets.
 let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'

 " Enable neosnippet snipmate compatibility mode
 let g:neosnippet#enable_snipmate_compatibility = 1

 " https://github.com/spf13/spf13-vim/issues/539
 let g:neosnippet#disable_runtime_snippets = { "_": 1, }

 " For snippet_complete marker.
 if has('conceal')
     set conceallevel=2 concealcursor=i
 endif

 " Disable the neosnippet preview candidate window
 " When enabled, there can be too much visual noise
 " especially when splits are used.
 set completeopt-=preview


 " Disable AutoComplPop.
 let g:acp_enableAtStartup = 0
 " Use neocomplcache.
 let g:neocomplcache_enable_at_startup = 1
 " Use smartcase.
 let g:neocomplcache_enable_smart_case = 1
 " Set minimum syntax keyword length.
 let g:neocomplcache_min_syntax_length = 3
 " Plugin key-mappings.
 inoremap <expr><C-g>     neocomplcache#undo_completion()
 inoremap <expr><C-l>     neocomplcache#complete_common_string()

 " Recommended key-mappings.
 " <CR>: close popup and save indent.
 inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
 function! s:my_cr_function()
   return neocomplcache#smart_close_popup() . "\<CR>"
   " For no inserting <CR> key.
   "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
 endfunction
 " <TAB>: completion.
 inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
 " <C-h>, <BS>: close popup and delete backword char.
 inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
 inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
 inoremap <expr><C-y>  neocomplcache#close_popup()
 inoremap <expr><C-e>  neocomplcache#cancel_popup()

" use ag instead of ack
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

nnoremap <F5> :GundoToggle<CR>


" General

let mapleader="\<Space>"

syntax on                       " Turn on syntax highlighting

set number                      " Line numbers are good
set ruler                       " Show current position in statusline
set cursorline                  " Highlight the screenline of the cursor
set showmode                    " Show current mode down the bottom
set visualbell                  " No sounds

set ignorecase                  " Ignore case when searching

set conceallevel=0

" press esc to stop search highlight
nnoremap <silent> <esc> :noh<return><esc>

set noswapfile
set nobackup
set nowb

set autoindent
set smartindent
set smartcase
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set colorcolumn=80
set autoread
set scrolloff=5
set updatetime=250

"key mapping for window navigation
map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
map <C-l> <C-w>l

"key mapping for tab navigation
nnoremap <C-k> :tabprevious<CR>
nnoremap <C-j> :tabnext<CR>

" retain visual selection after indent
vnoremap > >gv
vnoremap < <gv

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nnoremap <leader>. <c-^>        " Switch between last buffer

colorscheme solarized
set bg=dark
