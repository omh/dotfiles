" =============================================================================
" Bundles
" ==============================================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Custom plugins
Bundle 'tpope/vim-markdown'
"Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'omh/vim-colors'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'sjbach/lusty'
Bundle 'scrooloose/nerdtree'
Bundle 'omh/Kwbd.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'omh/vim-ez'
Bundle 'pangloss/vim-javascript'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'sophacles/vim-bundle-mako'
Bundle 'jgdavey/tslime.vim'
Bundle 'kshenoy/vim-signature'
Bundle 'hdima/python-syntax'
Bundle 'stephpy/vim-yaml'
filetype plugin indent on

" ==============================================================================
" General settings
" ==============================================================================
colorscheme hybrid

set scrolloff=5
set laststatus=2
set textwidth=79
set formatoptions=qrn1
set hidden
set wrap
set backspace=2
set number
set ruler

" set better autocomplete for finding files
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.o,*.obj,*.class,*.pyc,bin,*.log,*.pidb
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

" Disable folding!
set nofoldenable

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
set clipboard=unnamed

" Automatically read a file that has changed on disk
set autoread

" Turn on syntax highlighting
syntax on

" Treat all numbers as decimal
set nrformats=

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2000

" I don't like it when the matching parens are automatically highlighted
let g:matchparen_timeout = 10
let g:matchparen_insert_timeout = 10

" Set dictionary
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

"
set lazyredraw

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

" Set leader key
let mapleader = ","
noremap \ ,

" Two spaces=tab for ruby
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" Remember position in file
set viminfo='10,\"100,:20,%,n~/.viminfo
if has("autocmd")
      au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
          \| exe "normal g'\"" | endif
endif

" Statusline

" filename in purple
" line number LNNN CNNN
" <MODE> / I/N
" Git Branch
" Filetype
" <file enc>

set statusline=
set statusline+=\ ---\ \ %t                       "File+path
set statusline+=\ \%(L%l\ C%c%)       " Line number

" Puts in the current git status
set statusline+=\ \ %{strlen(fugitive#head())?'Git:'.fugitive#head():''}\ \ \ 

" Puts in syntastic warnings
set statusline+=\ %{SyntasticStatuslineFlag()}

set statusline+=\ %r\ %m
set statusline+=\ (%Y 
set statusline+=\ %{&ff}                                  "FileType
set statusline+=\ %{strlen(&fenc)?&fenc:&enc}) " File encoding
set statusline+=%=\ ---\ 
"set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
"set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
"set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
"set statusline+=%9*\ col:%03c\                            "Colnr
"set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.


" =============================================================================:
" Bundles configs
" ==============================================================================

" Fugitive
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR><C-w>15+
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" Lusty Explorer
map <silent> <leader>f :LustyFilesystemExplorer<CR>
map <silent> <leader>e :LustyFilesystemExplorerFromHere<CR>

" NERDTree
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['__pycache__$', '\~$']

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>v :NERDTreeFind<CR>

" Map Leader+wk to kill current buffer
map <leader>wk :Kwbd<CR>

nmap <leader>pm :CtrlPMRUFiles<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>j :CtrlPBuffer<CR>
nmap <leader>pl :CtrlPLine<CR>
" Put current word/current selected line into CtrlP
nmap <leader>lw :CtrlP<CR><C-\>w
vmap <leader>lw y:CtrlP<CR><C-\>c

" Don't manage the current directory
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>r :CtrlPFunky<Cr>

" Syntastic
let g:syntastic_auto_loc_list=0
let g:syntastic_loc_list_height=4
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checker_args='--ignore=E501'
let python_highlight_all=1

" Lightline
"let g:lightline = { 'colorscheme': 'hybrid' }
" Airline
" let g:airline_left_sep=''
" let g:airline_right_sep=''
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 0
" let g:airline_theme = 'ubaryd'

" Clear ez publish caches
nnoremap <leader>xke :call Send_to_Tmux("cd /var/www/kbase.localhost/htdocs/ezp/ && php ezpublish/console cache:clear\n")<CR>
nnoremap <leader>xea :ISlime2 php bin/php/ezpgenerateautoloads.php -e<CR>
nnoremap <leader>xei :ISlime2 php tests/runtests.php --dsn mysql://root@localhost/tests extension/klpbrightcove<CR>
nnoremap <leader>xeu :ISlime2 phpunit extension/klpbrightcove<CR>

" tmux tslime ---------------
" clear tmux settings
nnoremap <leader>xc :unlet g:tslime<CR>
nnoremap <leader>xyt :call Send_to_Tmux("./run_tests.py\n")<CR>
nnoremap <leader>xyd :call Send_to_Tmux("./run_tests.py --with-db\n")<CR>
nnoremap <leader>xyb :call Send_to_Tmux("cd docs && make html && cd -\n")<CR>
nnoremap <leader>xyo :call Send_to_Tmux("open docs/_build/html/index.html\n")<CR>

nnoremap <leader>xms :call Send_to_Tmux("./sync.sh\n")<CR>

nnoremap <leader>iD Oimport ipdb; ipdb.set_trace();<ESC>
nnoremap <leader>id oimport ipdb; ipdb.set_trace();<ESC>

au BufRead,BufNewFile *.tpl set filetype=ezp
au BufRead,BufNewFile *.php set foldmethod=indent
au BufRead,BufNewFile *.php set foldlevelstart=1
au BufRead,BufNewFile *.php let g:php_html_in_strings=0
au BufRead,BufNewFile *.php let g:php_folding=0
au BufRead,BufNewFile *.php let g:php_sql_query=0
au BufRead,BufNewFile *.twig set filetype=jinja

" Grepping
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <leader>a :Ag<space>
" Put current word into Ack
nnoremap <leader>A :Ag <C-r>=expand("<cword>")<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" ==============================================================================
" Keyboard Mappings
" ==============================================================================


" Default to verbatim search
nnoremap / /\V

" Map leader+space to clear searches
nnoremap <leader>/ :noh<cr>

" Map leader+wv to open new vsplit and switch to it
nnoremap <leader>wv <C-w>v<C-w>l
" Map leader+ws to open new hsplit and switch to it
nnoremap <leader>ws <C-w>s<C-w>j
" Map leader+wt to create new tab
nnoremap <leader>wt :tabnew<CR>

" Toggle spelling on/off
nnoremap <leader>d :setlocal spell! spelllang=en_gb<CR>

" Save file
nnoremap <leader>s :w<CR>

" Better movement with wrapped lines
nmap j gj
nmap k gk

" Easy window navigation
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Faster <Esc>
imap jj <Esc>

" Map Shift-{/Shift-} to Alt-j/Alt-k for easier jumping of paragraphs
nmap <M-k> <S-{>
nmap <M-j> <S-}>
vmap <M-k> <S-{>
vmap <M-j> <S-}>

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Ctrl+Enter to insert ; at the end of the line
inoremap <C-Enter> <C-S-o><S-A>;<ESC>
inoremap <C-^M> <C-S-o><S-A>;<ESC>;
nnoremap <C-Enter> <S-A>;<ESC>
nnoremap <C-^M> <S-A>;<ESC>

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

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Map Leader+q to close current window
map <leader>q :q<CR>

" Strip extra white space
nmap <leader>h :%s/\s\+$//<CR>

" Format XML
nmap <leader>xx :silent 1,$!xmllint --format --recover - 2>/dev/null<CR>

" Show syntax highlighting groups for word under cursor
nnoremap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
