set runtimepath+=$HOME/.vim/bundle/pathogen
call pathogen#runtime_append_all_bundles()

syn on
colorscheme zenburn3
set bg=dark

set hlsearch
set incsearch
set ignorecase
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set showcmd
set ruler
set nu
set spelllang=en_gb
"set spell
set nocompatible

set showmatch matchtime=3
set scrolloff=5
" Stop VIM asking if you want to write the file before leaving buffer
set autowrite
set hidden

autocmd FileType php let php_sql_query=1
autocmd FileType php let php_noShortTags=1
autocmd FileType php let php_htmlInStrings=1
autocmd FileType php let php_folding=1
" set "make" command when editing php files
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

filetype plugin on

let mapleader = ","

" autocomplete funcs and identifiers for languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" set better autocomplete for finding files
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.o,*.obj,.git,*.class,*.pyc,bin,*.log,obj,*.pidb
set wildignore+=*.aux,*.bbl,*.blg,*.fdb_latexmk,*.bst,*.pdf

" Ignore eZ Publish related stuff
set wildignore+=var/*

" more history
set history=1000

" Set directory to where backups and temp files are store
set backupdir=/tmp/
set directory=/tmp/

set laststatus=2
set statusline=
set statusline+=%f\                          " file name
set statusline+=%=                           " right align
set statusline+=%{fugitive#statusline()}   " current git branch
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]\             " file format
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" set encoding
set enc=utf-8                
set fileformats=unix,dos,mac

" Turn of matching brackets, etc as it's slow
let loaded_matchparen = 1

" Mappings for ZenCoding
let g:user_zen_expandabbr_key = '<D-d>'

" Command-T settings
let g:CommandTMaxHeight=40


