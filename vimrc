set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'omh/vim-colors'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'sjbach/lusty'
Plug 'omh/Kwbd.vim'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'jgdavey/tslime.vim'
Plug 'kshenoy/vim-signature'
Plug 'omh/vim-ez'
Plug 'sheerun/vim-polyglot'
Plug 'gcmt/taboo.vim'
Plug 'dkprice/vim-easygrep'
Plug 'tpope/vim-endwise'
Plug 'ajh17/VimCompletesMe'
Plug 'tweekmonster/braceless.vim'
Plug 'neomake/neomake'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-characterize'
Plug 'morhetz/gruvbox'
Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'

call plug#end()

filetype plugin indent on

" ==============================================================================
" General settings
" ==============================================================================


"let g:seoul256_background = 235
set bg=dark
"let g:gruvbox_contrast_dark = "medium"
let g:gitgutter_override_sign_column_highlight = 1
"colorscheme gruvbox
colorscheme jellybeans3

set laststatus=2  " Always show status line
set scrolloff=5
set textwidth=79
set formatoptions=qrn1
set hidden
set wrap
set backspace=2
set ruler
set cursorline
set number

" Timeout
set timeout
set timeoutlen=500
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
set synmaxcol=200

" Use old regex engine, faster
set regexpengine=1
set noshowcmd
set ttyfast
"set lazyredraw

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

" Enable gui colors
if has("termguicolors")
    set termguicolors
    if &term =~# '^screen'
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
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

"" Status Line: {{{

"" Status Function: {{{2
"function! Status(winnr)
  "let stat = ''
  "let active = winnr() == a:winnr
  "let buffer = winbufnr(a:winnr)

  "let modified = getbufvar(buffer, '&modified')
  "let readonly = getbufvar(buffer, '&ro')
  "let fname = bufname(buffer)

  "function! Color(active, num, content)
    "if a:active
      "return '%' . a:num . '*' . a:content . '%*'
    "else
      "return a:content
    "endif
  "endfunction

  "" file
  "let stat .= Color(active, 3, active ? ' »' : ' «')
  "let stat .= ' %<'
  "let stat .= '%f'

  "" File type
  "let stat .= Color(active, 5, " (")
  "let stat .= Color(active, 5, "%{strlen(&filetype)?&filetype:'none'}")
  "" File format
  "let stat .= Color(active, 5, ", %{&ff}")
  "" file encoding
  "let stat .= Color(active, 5, ", %{strlen(&fenc)?&fenc:'none'}")
  "let stat .= Color(active, 5, ")")


  "let stat .= ' ' . Color(active, 3, active ? '«' : '»')

  "" file modified
  "let stat .= Color(active, 2, modified ? ' +' : '  ')

  "" read only
  "let stat .= Color(active, 2, readonly ? ' RO' : '')

  "" paste
  "if active && &paste
    "let stat .= ' %2*' . ' PASTE' . '%*'
  "endif

  "if exists("*SyntasticStatuslineFlag")
      "let errors = SyntasticStatuslineFlag()
      "let stat .= Color(active, 2, ' ' . "%{SyntasticStatuslineFlag()}")
  "endif

  "" right side
  "let stat .= '%='

  "" git branch
  "if exists('*fugitive#head')
    "let head = fugitive#head()

    "if empty(head) && exists('*fugitive#detect') && !exists('b:git_dir')
      "call fugitive#detect(getcwd())
      "let head = fugitive#head()
    "endif
  "endif

  "if !empty(head)
    "let stat .= Color(active, 3, ' ← ') . head . ' '
  "endif

  "let stat .= Color(active, 5, ' %3l:%-2c ')

  "return stat
"endfunction
"" }}}

"" Status AutoCMD: {{{
"function! SetStatus()
  "for nr in range(1, winnr('$'))
    "call setwinvar(nr, '&statusline', '%!Status('.nr.')')
  "endfor
"endfunction

"augroup status
  "autocmd!
  "autocmd VimEnter,WinEnter,BufWinEnter,BufUnload * call SetStatus()
"augroup END
"" }}}

" Status Colors: {{{
"hi User1 ctermfg=33  guifg=#268bd2  ctermbg=236 guibg=#3F3F3F
"hi User2 ctermfg=131 guifg=#d33682  ctermbg=236 guibg=#3F3F3F
"hi User3 ctermfg=64  guifg=#719e07  ctermbg=236 guibg=#3F3F3F
"hi User4 ctermfg=37  guifg=#2aa198  ctermbg=236 guibg=#3F3F3F
"hi User5 ctermfg=101  guifg=#989A6D ctermbg=236 guibg=#3F3F3F

 ""gruvbox
"hi User1 ctermfg=33  guifg=#268bd2  ctermbg=239 guibg=#504945
"hi User2 ctermfg=131 guifg=#d33682  ctermbg=239 guibg=#504945
"hi User3 ctermfg=64  guifg=#719e07  ctermbg=239 guibg=#504945
"hi User4 ctermfg=37  guifg=#2aa198  ctermbg=239 guibg=#504945
"hi User5 ctermfg=101  guifg=#989A6D ctermbg=239 guibg=#504945
"" }}}

 "jellybeans
"hi User1 ctermfg=66  guifg=#ffffff  ctermbg=239 guibg=#403c41
"hi User2 ctermfg=66 guifg=#cf6a4c  ctermbg=239 guibg=#403c41
"hi User3 ctermfg=66  guifg=#99ad6a  ctermbg=239 guibg=#403c41
"hi User4 ctermfg=66  guifg=#ffffff  ctermbg=239 guibg=#403c41
"hi User5 ctermfg=66  guifg=#bbbbbb ctermbg=239 guibg=#403c41

" }}}

let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
\ }


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
"let g:syntastic_auto_loc_list=0
"let g:syntastic_loc_list_height=4
"let g:syntastic_python_checkers=['flake8']
"let g:syntastic_python_flake8_post_args='--ignore=E501,C0111,C0301,R0903'
"let g:syntastic_stl_format='%E{!! err:%fe/%e}%W{warn:%fw/%w}'

" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_enabled_makers = ['pep8']
let g:neomake_python_pep8_maker = { 'args': ['--ignore=E501'] }
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E501,C0111,C0301,R0903', '--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd FileType html let b:vcm_tab_complete = 'omni'
autocmd FileType css let b:vcm_tab_complete = 'omni'
autocmd FileType php let b:vcm_tab_complete = 'omni'
autocmd FileType python let b:vcm_tab_complete = 'omni'

" Enable braceless
autocmd FileType python BracelessEnable +indent

" CtrlP
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'noglob ag %s --ignore=extjs-4.2.1 --ignore=*.pyc -l --nocolor -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
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

" Signatures
let g:SignatureMarkTextHL = "Exception"

" Auto close html
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.tpl,*.hbs"

" FZF
if executable('ag')
  let $FZF_DEFAULT_COMMAND= 'ag --ignore safirweb/static/extjs-4.2.1 -g ""'
endif


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

" Don't override register when pasting
xnoremap p pgvy

" Find
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
nnoremap <leader>ss :Find <C-r><C-w>
nnoremap <leader>sw :call fzf#vim#grep(fzf#wrap({'options': '-q ' . expand('<cword>')}))<cr>

" Files
nnoremap <leader>fb :LustyFilesystemExplorer<cr>
nnoremap <leader>fh :LustyFilesystemExplorerFromHere<cr>
nnoremap <leader>fe :GFiles<cr>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fw :call fzf#run(fzf#wrap({'options': '-q ' . expand('<cword>')}))<cr>

nnoremap <leader>fs :<C-u>w<cr>
nnoremap <leader>fr :bye<C-u>History<cr><C-r>*
nnoremap <leader>fc :<C-u>!mkdir -p %:h<cr>:w<cr>
nnoremap <leader>fed :<C-u>e ~/.vimrc<cr>
nnoremap <leader>fer :<C-u>source ~/.vimrc<cr>
" Because it's so damn easy to press...
nnoremap <leader><space> :Buffers<cr>

" Buffers
nnoremap <leader>bb :<C-u>Buffers<cr>
nnoremap <leader>bo :<C-u>BTags<CR>
nnoremap <leader>bl :BLines<cr>
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
nnoremap tj :<C-u>tabmove -1<cr>
nnoremap tk :<C-u>tabmove +1<cr>
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
nnoremap <leader>rec :call Send_to_Tmux("starter clear\n")<cr>
command! -nargs=+ -bar SyncDB :call Send_to_Tmux("fab sync_db:<args>\n")
nnoremap <leader>rsy :SyncDB<space>

nnoremap <leader>rfc :call Send_to_Tmux("fab changes\n")<cr>
nnoremap <leader>rfd :call Send_to_Tmux("fab deploy\n")<cr>
nnoremap <leader>rt :call Send_to_Tmux("pytest -x -k 'not functional'\n")<cr>
function! TestCurrentFile()
    return "pytest " . expand('%') . "\n"
endfunction
nnoremap <leader>rf :call Send_to_Tmux(TestCurrentFile())<cr>
" Run last command
nnoremap <leader>rr :call Send_to_Tmux("fc -e : -1\n")<cr>


" Inserts
nnoremap <leader>iD Oimport ipdb; ipdb.set_trace();<esc>
nnoremap <leader>id oimport ipdb; ipdb.set_trace();<esc>
nnoremap <leader>iu i# -*- coding: utf-8 -*-<esc>

" Misc
inoremap jk <Esc>
