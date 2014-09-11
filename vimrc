" =============================================================================
" Bundles
" ==============================================================================

set nocompatible
filetype off

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_server_use_vim_stdout = 1
let g:ycm_filetype_blacklist = { 'python': 1 }
let g:ycm_filetype_specific_completion_to_disable = { 'python': 1 }

call plug#begin('~/.vim/plugged')

" Custom plugins
Plug 'ervandew/supertab'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'omh/vim-colors'
Plug 'tpope/vim-fugitive'
Plug 'sjbach/lusty'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'omh/Kwbd.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky', { 'on': 'CtrlPFunky' }
Plug 'omh/vim-ez', { 'for': ['tpl', 'ini'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'jinja2' }
Plug 'jgdavey/tslime.vim'
Plug 'kshenoy/vim-signature'
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'Rykka/riv.vim'
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/gitignore', { 'for': 'gitignore' }
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/YankRing.vim', { 'on': 'YRShow' }
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'nathanaelkane/vim-indent-guides', { 'on': 'IndentGuidesToggle' }
Plug 'Shougo/neocomplcache.vim'
call plug#end()

filetype plugin indent on
" ==============================================================================
" General settings
" ==============================================================================
let g:seoul256_background = 235
colorscheme seoul256

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
let mapleader = " "
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
" Git Gutter

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

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

" Airline
let g:airline_left_sep=''
let g:airline_right_sep=''
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme = 'monochrome'

" YankRing
nnoremap <leader>y :YRShow<cr>
let g:yankring_history_dir = '$VIM'

" Youcompleteme
nnoremap <leader>od :YcmCompleter GoToDeclaration<cr>

" Gundo
nnoremap <leader>u :GundoToggle<cr>

" Clear ez publish caches
nnoremap <leader>xke :call Send_to_Tmux("cd /var/www/kbase.localhost/htdocs/ezp/ && php ezpublish/console cache:clear\n")<CR>

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
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <leader>a :Ag<space>
" Put current word into Ack
nnoremap <leader>A :Ag <C-r>=expand("<cword>")<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Vim indent guides
nnoremap <leader>ig :IndentGuidesToggle<cr>

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:jedi#auto_initialization = 1
if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
endif
if !exists('g:neocomplcache_force_omni_patterns')
      let g:neocomplcache_force_omni_patterns = {}
  endif
let g:neocomplcache_omni_functions['python'] = 'jedi#completions'
let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
set ofu=syntaxcomplete#Complete
let g:jedi#popup_on_dot = 0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType python let b:did_ftplugin = 1


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

" Map Leader+q to close current window
map <leader>q :q<CR>

" Strip extra white space
nmap <leader>h :%s/\s\+$//<CR>

" Format XML
nmap <leader>xx :silent 1,$!xmllint --format --recover - 2>/dev/null<CR>

" Show syntax highlighting groups for word under cursor
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap <C-o> :call <SID>SynStack()<CR>
