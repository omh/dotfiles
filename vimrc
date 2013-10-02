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
Bundle 'bling/vim-airline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-surround'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'omh/vim-colors'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Shougo/neocomplcache'
Bundle 'sjbach/lusty'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdtree'
Bundle 'omh/Kwbd.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'omh/vim-ez'
Bundle 'omh/vim-islime2'
Bundle 'ap/vim-css-color'
Bundle 'pangloss/vim-javascript'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'sophacles/vim-bundle-mako'
Bundle 'jgdavey/tslime.vim'
filetype plugin indent on

" ==============================================================================
" General settings
" ==============================================================================
colorscheme oh-hemisu

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

" Faster redraw
set lazyredraw

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

" Cursor lie
set cursorline

" Use system clipboard instead of vim's
set clipboard=unnamed

" Automatically read a file that has changed on disk
set autoread

" Turn on syntax highlighting
syntax on

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2000

" I don't like it when the matching parens are automatically highlighted
let loaded_matchparen = 1

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

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

" Two spaces=tab for ruby
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" Remember position in file
set viminfo='10,\"100,:20,%,n~/.viminfo
if has("autocmd")
      au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
          \| exe "normal g'\"" | endif
endif

" =============================================================================:
" Bundles configs
" ==============================================================================

nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR><C-w>15+
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 5

let g:LustyJugglerShowKeys = 'a'
let g:LustyJugglerAltTabMode = 1
map <silent> <leader>f :LustyFilesystemExplorer<CR>
map <silent> <leader>e :LustyFilesystemExplorerFromHere<CR>
map <silent> <leader>p :LustyJuggler<CR>
noremap <silent> <A-s> :LustyJuggler<CR>

" Single lines
nmap <M-S-k> [e
nmap <M-S-j> ]e
" Move single lines
vmap <M-S-k> [egv
vmap <M-S-j> ]egv

nmap <leader>a :Ack<space>
" Put current word into Ack
nmap <leader>za :Ack "<C-r>=expand("<cword>")<CR>"
vmap <leader>za y:Ack "<C-r>""

let NERDTreeMinimalUI=1
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['__pycache__$', '\~$']

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>v :NERDTreeFind<CR>

" Map Leader+k to kill current buffer
map <silent> <leader>k :Kwbd<CR>

nmap <silent> <leader>b :CtrlPMRUFiles<CR>
nmap <silent> <leader>t :CtrlP<CR>
nmap ; :CtrlPBuffer<CR>
nmap <silent> <leader>ll :CtrlPLine<CR>
" Put current word/current selected line into CtrlP
nmap <silent> <leader>lw :CtrlP<CR><C-\>w
vmap <silent> <leader>lw y:CtrlP<CR><C-\>c

" Don't manage the current directory
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>r :CtrlPFunky<Cr>

" Syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=4
" Disable, let python-mode do this.
let g:syntastic_python_checkers=['']

" Airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme='ubaryd'
let g:airline#extensions#tabline#enabled = 1

" iSlime2

" Rerun the previous iSlime2 command
nnoremap <leader>xr :ISlime2Rerun<CR>

" Send up and enter to re-run the previous command
nnoremap <leader>xp :ISlime2UpEnter<CR>

" Clear ez publish caches
nnoremap <silent> <leader>xee :ISlime2 php bin/php/ezcache.php --clear-all<CR>
nnoremap <silent> <leader>xea :ISlime2 php bin/php/ezpgenerateautoloads.php -e<CR>
nnoremap <silent> <leader>xei :ISlime2 php tests/runtests.php --dsn mysql://root@localhost/tests extension/klpbrightcove<CR>
nnoremap <silent> <leader>xeu :ISlime2 phpunit extension/klpbrightcove<CR>

" tmux tslime ---------------
" clear tmux settings
nnoremap <leader>xc :unlet g:tslime<CR>
nnoremap <leader>xyt :call Send_to_Tmux("./run_tests.py\n")<CR>
nnoremap <leader>xyd :call Send_to_Tmux("./run_tests.py --with-db\n")<CR>

au BufRead,BufNewFile *.tpl set filetype=ezp
au BufRead,BufNewFile *.php set foldmethod=indent
au BufRead,BufNewFile *.php set foldlevelstart=1
au BufRead,BufNewFile *.php let g:php_html_in_strings=0
au BufRead,BufNewFile *.php let g:php_folding=0
au BufRead,BufNewFile *.php let g:php_sql_query=0

" ==============================================================================
" Keyboard Mappings
" ==============================================================================

" Map leader+space to clear searches
nnoremap <leader>/ :silent noh<cr>

" Map leader+w to open new vsplit and switch to it
nnoremap <leader>w <C-w>v<C-w>l

" Toggle spelling on/off
nmap <leader>s :setlocal spell! spelllang=en_gb<CR>

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

" Ctrl+Enter to insert ; at the end of the line
inoremap <C-Enter> <C-S-o><S-A>;<ESC>
inoremap <C-^M> <C-S-o><S-A>;<ESC>
nnoremap <C-Enter> <S-A>;<ESC>
nnoremap <C-^M> <S-A>;<ESC>

" Tabs
map <C-left> :tabprev<CR>
map <C-right> :tabnext<CR>

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
nnoremap <C-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Interesting words highlight
nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>
hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}
