" ==============================================================================
" general settings
" ==============================================================================

set scrolloff=5
set laststatus=2
set textwidth=79
set formatoptions=qrn1
set hidden
set wrap
set backspace=2
set number

" set better autocomplete for finding files
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.o,*.obj,*.class,*.pyc,bin,*.log,*.pidb
set wildignore+=*.aux,*.bbl,*.blg,*.fdb_latexmk,*.bst,*.pdf
set wildignore+=*.gif,*.png,*.db,*.jpg,*.jpeg
set wildignore+=*/cache/*
set wildignore+=*/.git/*
set wildignore+=*/.svn/*
set wildignore+=TAGS
set wildignore+=tags
set wildignore+=var/*
set wildignore+=*tmp/*

" more history
set history=1000

" Set directory to where backups and temp files are store
set backupdir=/tmp/
set directory=/tmp/

" Searching
set ignorecase
set gdefault " global substitue
set incsearch
set showmatch
set hlsearch

" Timeout
set timeout
set timeoutlen=1000
set ttimeoutlen=10

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac

" Tabs
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

" Use system clipboard instead of vim's
set clipboard+=unnamed

" Automatically read a file that has changed on disk
set autoread

" Turn on syntax highlighting
syntax on

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=200

" I don't like it when the matching parens are automatically highlighted
let loaded_matchparen = 1

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Normal/insert mode change cursor in terminal
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Disable all blinking
set gcr=a:blinkon0

" Set leader key
let mapleader = ","

" ==============================================================================
" Plugins
" ==============================================================================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

filetype plugin indent on
" Custom plugins

Bundle 'bbommarito/vim-slim'
Bundle 'tpope/vim-markdown'

Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'omh/vim-colors'
Bundle 'msanders/snipmate.vim'

" Fugitive
Bundle 'tpope/vim-fugitive'
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" CamelCaseMotion
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e
Bundle 'bkad/CamelCaseMotion'

" Neo Complete / Snippet
Bundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3

" PHP
Bundle 'spf13/PIV'
let g:pdv_cfg_php4always=0
let g:pdv_cfg_php4guess=0
let g:pdv_cfg_CommentEnd=""

" Buffet
Bundle 'sandeepcr529/Buffet.vim'
map <leader>m :Bufferlistsw<CR>

" Lusty Explorer
Bundle 'sjbach/lusty'
map <silent> <leader>f :LustyFilesystemExplorer<CR>
map <silent> <leader>r :LustyFilesystemExplorerFromHere<CR>

" Unimpaired
Bundle 'tpope/vim-unimpaired'
" Single lines
nmap <M-S-k> [e
nmap <M-S-j> ]e
" Move single lines
vmap <M-S-k> [egv
vmap <M-S-j> ]egv

" Ack
nmap <leader>a :Ack<space>
" Put current word into Ack
nmap <leader>za :Ack "<C-r>=expand("<cword>")<CR>"
vmap <leader>za y:Ack "<C-r>""

" NerdTree
Bundle 'scrooloose/nerdtree'
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>v :NERDTreeFind<CR>

" Kwbd
Bundle 'rgarver/Kwbd.vim'
" Map Leader+k to kill current buffer
map <silent> <leader>k :Kwbd<CR>

" CtrlP
Bundle 'kien/ctrlp.vim'
nmap <silent> <leader>b :CtrlPMRUFiles<CR>
nmap <silent> <leader>t :CtrlP<CR>
nmap <silent> <leader>ll :CtrlPLine<CR>
" Don't manage the current directory
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 20

" Load vim-ez last to make sure it overrides smarty
Bundle 'omh/vim-ez'
au BufRead,BufNewFile *.tpl  set filetype=ezp

" ==============================================================================
" Keyboard Mappings
" ==============================================================================

" Map leader+space to clear searches
nnoremap <leader>/ :silent noh<cr>

" Map leader+w to open new vsplit and switch to it
nnoremap <leader>w <C-w>v<C-w>l

" Toggle spelling on/off
nmap <leader>s :setlocal spell! spelllang=en_gb<CR>

" Easy window navigation
nmap <C-up> <C-w>k
nmap <C-down> <C-w>j
nmap <C-left> <C-w>h
nmap <C-right> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Faster <Esc>
imap jj <Esc>

" Map Shift-{/Shift-} to Alt-j/Alt-k for easier jumping of paragraphs
nmap <M-k> <S-{>
nmap <M-j> <S-}>

" Don't yank selected text in visual mode overwriting text by yanking
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
vnoremap p "_dP
vnoremap P "_dP
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X

" Map Leader+q to close current window
map <leader>q :q<CR>

" Strip extra white space
nmap <leader>h :%s/\s\+$//<CR>

" Format XML
nmap <leader>x :silent 1,$!xmllint --format --recover - 2>/dev/null<CR>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

colorscheme oh
