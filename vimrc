set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
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
Plug 'kshenoy/vim-signature'
Plug 'omh/vim-ez', { 'for': ['tpl', 'ini'] }
Plug 'sheerun/vim-polyglot'
Plug 'gcmt/taboo.vim'
Plug 'dkprice/vim-easygrep'
Plug 'tpope/vim-endwise'
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
"set cursorline

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
set synmaxcol=1000

" Remember tab names
set sessionoptions+=tabpages,globals

" Fold by indent, syntax is too slow
set foldmethod=indent
set foldlevelstart=99

" Disable highlighting of matching parenthesis
let loaded_matchparen = 1

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

" Status Line: {{{

" Status Function: {{{2
function! Status(winnr)
  let stat = ''
  let active = winnr() == a:winnr
  let buffer = winbufnr(a:winnr)

  let modified = getbufvar(buffer, '&modified')
  let readonly = getbufvar(buffer, '&ro')
  let fname = bufname(buffer)

  function! Color(active, num, content)
    if a:active
      return '%' . a:num . '*' . a:content . '%*'
    else
      return a:content
    endif
  endfunction

  " file
  let stat .= Color(active, 3, active ? ' »' : ' «')
  let stat .= ' %<'
  let stat .= '%f'

  " File type
  let stat .= Color(active, 5, " (")
  let stat .= Color(active, 5, "%{strlen(&filetype)?&filetype:'none'}")
  " File format
  let stat .= Color(active, 5, ", %{&ff}")
  " file encoding
  let stat .= Color(active, 5, ", %{strlen(&fenc)?&fenc:'none'}")
  let stat .= Color(active, 5, ")")


  let stat .= ' ' . Color(active, 3, active ? '«' : '»')

  " file modified
  let stat .= Color(active, 2, modified ? ' +' : '  ')

  " read only
  let stat .= Color(active, 2, readonly ? ' RO' : '')

  " paste
  if active && &paste
    let stat .= ' %2*' . ' PASTE' . '%*'
  endif

  if exists("*SyntasticStatuslineFlag")
      let errors = SyntasticStatuslineFlag()
      let stat .= Color(active, 2, ' ' . "%{SyntasticStatuslineFlag()}")
  endif

  " right side
  let stat .= '%='

  " git branch
  if exists('*fugitive#head')
    let head = fugitive#head()

    if empty(head) && exists('*fugitive#detect') && !exists('b:git_dir')
      call fugitive#detect(getcwd())
      let head = fugitive#head()
    endif
  endif

  if !empty(head)
    let stat .= Color(active, 3, ' ← ') . head . ' '
  endif

  let stat .= Color(active, 5, ' %3l:%-2c ')

  return stat
endfunction
" }}}

" Status AutoCMD: {{{
function! SetStatus()
  for nr in range(1, winnr('$'))
    call setwinvar(nr, '&statusline', '%!Status('.nr.')')
  endfor
endfunction

augroup status
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter,BufUnload * call SetStatus()
augroup END
" }}}

" Status Colors: {{{
hi User1 ctermfg=33  guifg=#268bd2  ctermbg=237 guibg=#fdf6e3
hi User2 ctermfg=131 guifg=#d33682  ctermbg=237 guibg=#eee8d5
hi User3 ctermfg=64  guifg=#719e07  ctermbg=237 guibg=#eee8d5
hi User4 ctermfg=37  guifg=#2aa198  ctermbg=237 guibg=#eee8d5
hi User5 ctermfg=101  guifg=#2aa198 ctermbg=237 guibg=#eee8d5
" }}}



" ==============================================================================
" Plugin settings
" ==============================================================================

" Airline
"let g:airline_left_sep=''
"let g:airline_right_sep=''
"let g:airline_powerline_fonts = 0
"let g:airline_theme = 'lucius'
"let g:airline#extensions#tagbar#enabled = 0
"let g:airline_extensions = []

" Git Gutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Tagbar
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_vertical = 30
let g:tagbar_iconchars = ['▸', '▾']

" Syntastic
let g:syntastic_auto_loc_list=0
let g:syntastic_loc_list_height=4
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_post_args='--ignore=E501'
let g:syntastic_stl_format='%E{!! err:%fe/%e}%W{warn:%fw/%w}'

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 4
let g:neocomplete#disable_auto_complete = 1
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
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

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'noglob ag %s --ignore=extjs-4.2.1 --ignore=*.pyc -l --nocolor -g ""'
endif


fu! CtrlP_main_status(...)
  let regex = a:3 ? '%2*regex %*' : ''
  let prv = '%#StatusLineNC# '.a:4.' %*'
  let item = ' ' . (a:5 == 'mru files' ? 'mru' : a:5) . ' '
  let nxt = '%#StatusLineNC# '.a:6.' %*'
  let byfname = '%2* '.a:2.' %*'
  let dir = '%3* ← %*%#StatusLineNC#' . fnamemodify(getcwd(), ':~') . '%* '

  " only outputs current mode
  retu ' (ctrlp) %4*»%*' . item . '%4*«%* ' . '%=%<' . dir

  " outputs previous/next modes as well
  " retu prv . '%4*»%*' . item . '%4*«%*' . nxt . '%=%<' . dir
endf
 
" Argument: len
"           a:1
fu! CtrlP_progress_status(...)
  let len = '%#Function# '.a:1.' %*'
  let dir = ' %=%<%#LineNr# '.getcwd().' %*'
  retu len.dir
endf

hi CtrlP_Purple  ctermfg=255 guifg=#ffffff  ctermbg=54  guibg=#5f5faf
hi CtrlP_IPurple ctermfg=54  guifg=#5f5faf  ctermbg=255 guibg=#ffffff
hi CtrlP_Violet  ctermfg=54  guifg=#5f5faf  ctermbg=104 guibg=#aeaed7

let g:ctrlp_status_func = {
  \ 'main': 'CtrlP_main_status',
  \ 'prog': 'CtrlP_progress_status'
  \}


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
nmap <leader>fw :<C-u>CtrlPCurWD<cr><C-\>w
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
nnoremap <leader>bo :<C-u>CtrlPBufTag<CR>
nmap <leader>bw :CtrlPBufTag<CR><C-\>w
nnoremap <leader>sl :<C-u>TagbarOpenAutoClose<cr>
nnoremap <leader>bsf :<C-u>TagbarCurrentTag {'f'}<cr>
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
nnoremap <leader>gl :Git log<cr>
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

" Misc
inoremap jk <Esc>
