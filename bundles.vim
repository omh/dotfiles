set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

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
Bundle 'omh/Kwbd.vim'
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

filetype plugin indent on
