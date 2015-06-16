" Search s /ag/
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'omh/vim-colors'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'majutsushi/tagbar'
Plug 'sjbach/lusty'
Plug 'omh/Kwbd.vim'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'jgdavey/tslime.vim'
Plug 'davidhalter/jedi-vim'
Plug 'kshenoy/vim-signature'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'omh/vim-ez'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'gregsexton/MatchTag'
Plug 'sheerun/vim-polyglot'
Plug 'gcmt/taboo.vim'
call plug#end()

filetype plugin indent on

" ==============================================================================
" General settings
" ==============================================================================

let g:seoul256_background = 236
set bg=dark
colorscheme seoul256

set laststatus=2  " Always show status line
set scrolloff=5
set textwidth=79
set formatoptions=qrn1
set hidden
set wrap
set backspace=2
set ruler
set cursorline

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

" Searching
set ignorecase
set gdefault " global substitue
set incsearch
set showmatch
set hlsearch

set nobackup       " no backup files
set nowritebackup  " only in case you don't want a backup file while editing
set noswapfile     " no swap files

" Use system clipboard instead of vim's
set clipboard=unnamed

" Automatically read a file that has changed on disk
set autoread

" Treat all numbers as decimal
set nrformats=

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2000

" Remember tab names
set sessionoptions+=tabpages,globals

" Normal/insert mode change cursor in terminal
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Turn on mouse support
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Disable all blinking
set gcr=a:blinkon0

set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*.obj,*.class,*.pyc,bin,*.log,*.pidb
set wildignore+=*.aux,*.bbl,*.blg,*.fdb_latexmk,*.bst,*.pdf
set wildignore+=*.gif,*.png,*.db,*.jpg,*.jpeg
set wildignore+=*/.git/*
set wildignore+=*/.svn/*
set wildignore+=TAGS
set wildignore+=tags
set wildignore+=var/*
set wildignore+=*tmp/*
set wildignore+=*/venv/*
set wildignore+=*__pycache__*

au FileType jinja,html,eruby,rb,css,js,xml runtime! macros/matchit.vim
au BufRead, BufNewFile *.tpl set filetype=ezp

" ==============================================================================
" Plugin settings
" ==============================================================================

" Airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_powerline_fonts = 0
let g:airline_theme = 'lucius'
let g:airline#extensions#tagbar#flags = 'f'

" Ack
if executable('ag')
    let g:ackprg = 'ag --column'
    set grepprg=noglob\ ag\ --nogroup\ --nocolor\ --ignore="*.pyc"
endif

" Tagbar
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_vertical = 30
let g:tagbar_iconchars = ['▸', '▾']


" Syntastic
let g:syntastic_auto_loc_list=0
let g:syntastic_loc_list_height=4
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checker_args='--ignore=E501'

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python =
\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" CtrlP
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\(extjs*)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'noglob ag %s --ignore=extjs-4.2.1 --ignore=*.pyc -l --nocolor -g ""'
endif

" Taboo
let g:taboo_tab_format = ' %N %f %m '
let g:taboo_renamed_tab_format = ' %N %l (%f) %m '


" ==============================================================================
" Keyboard bindings
" ==============================================================================
let mapleader = " "

nnoremap Q <nop>
nnoremap <leader>Q :qall<cr>

" Default to verbatim search
nnoremap / /\V

" clear searches
nnoremap <leader>sc :noh<cr>

" Better movement with wrapped lines
nmap j gj
nmap k gk

" Easy window navigation
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Easier to type start/end of line
noremap H ^
noremap L $

" Emacs style home/end
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Files
nnoremap <leader>fb :LustyFilesystemExplorer<cr>
nnoremap <leader>fh :LustyFilesystemExplorerFromHere<cr>
nnoremap <leader>ff :<C-u>CtrlPCurWD<cr>
nnoremap <leader>fs :<C-u>w<cr>
nnoremap <leader>fr :<C-u>CtrlPMRUFiles<cr>
nnoremap <leader>fc :<C-u>!mkdir -p %:h<cr>:w<cr>
nnoremap <leader>fI :<C-u>CtrlPClearAllCaches<cr>
nnoremap <leader>fcf :<C-u>CtrlPCurFile<cr>
nnoremap <leader>fed :<C-u>e ~/.vimrc<cr>
nnoremap <leader>fer :<C-u>source ~/.vimrc<cr>

" Buffers
nnoremap <leader>bb :<C-u>CtrlPBuffer<cr>
nnoremap <leader>bo :<C-u>TagbarOpenAutoClose<cr>
nnoremap <leader>bd :Kwbd<cr>
nnoremap <leader>bk :Kwbd<cr>

" Tabs
nnoremap <leader>tn :<C-u>tabnew<cr>
nnoremap <leader>tc :<C-u>tabclose<cr>
nnoremap <leader>tj :<C-u>tabmove -1<cr>
nnoremap <leader>tk :<C-u>tabmove +1<cr>
nnoremap <leader>tr :<C-u>TabooRename 
nnoremap <leader>tz :<C-u>TabooReset<cr>
nnoremap tl :<C-u>tabnext<cr>
nnoremap th :<C-u>tabprev<cr>
nnoremap t1 1gt
nnoremap t2 2gt
nnoremap t3 3gt
nnoremap t4 4gt
nnoremap t5 5gt
nnoremap t6 6gt
nnoremap t7 7gt
nnoremap t8 8gt
nnoremap t9 9gt

" Windows
nnoremap <leader>wc :<C-u>q<cr>
nnoremap <leader>wv :<C-u>vsplit<cr>
nnoremap <leader>ws :<C-u>split<cr>

" Git
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gs :Gstatus<cr><C-w>15+
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gu :Git pull<cr>

" Toggles
nnoremap <leader>Tp :set paste!<cr>
nnoremap <leader>Tn :set number!<cr>
nnoremap <leader>Tl :set cursorline!<cr>
nnoremap <leader>Ts :setlocal spell! spelllang=en_us<cr>
nnoremap <leader>Tc :SyntasticToggleMode<cr>

" Strip extra white space
nnoremap <leader>xdw :%s/\s\+$//<cr>
nnoremap <leader>xfx :silent 1,$!xmllint --format --recover - 2>/dev/null<cr>
nnoremap <leader>xfj :%!python -m json.tool<cr>

" Apps
nnoremap <leader>ann :<C-u>NERDTreeToggle<cr>
nnoremap <leader>anf :<C-u>NERDTreeFind<cr>

" Run (tslime)
nnoremap <leader>rc :unlet g:tslime<cr>
nnoremap <leader>ryt :call Send_to_Tmux("./run_tests.py\n")<cr>
nnoremap <leader>ryd :call Send_to_Tmux("./run_tests.py --with-db\n")<cr>
nnoremap <leader>ryb :call Send_to_Tmux("cd docs && make html && cd -\n")<cr>
nnoremap <leader>ryo :call Send_to_Tmux("open docs/_build/html/index.html\n")<cr>
nnoremap <leader>rst :call Send_to_Tmux("make test\n")<cr>
nnoremap <leader>rss :call Send_to_Tmux("make static\n")<cr>
command! -nargs=+ -bar SyncDB :call Send_to_Tmux("fab sync_db:<args>\n")
nnoremap <leader>rsy :SyncDB<space>

nnoremap <leader>rfc :call Send_to_Tmux("fab changes\n")<cr>
nnoremap <leader>rfd :call Send_to_Tmux("fab deploy\n")<cr>

" Inserts
nnoremap <leader>iD Oimport ipdb; ipdb.set_trace();<esc>
nnoremap <leader>id oimport ipdb; ipdb.set_trace();<esc>
nnoremap <leader>iu i# -*- coding: utf-8 -*-<esc>
