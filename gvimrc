if has("gui_macvim")
    " Hide all scrollbars and toolbars
    set go-=L
    set guioptions-=r
    set guioptions-=T
    
    " Turn on highlighting of current line
    set cursorline

    set gfn=Menlo:h10
    set linespace=2

    " Turn on anti alias
    set anti

    colorscheme jellybeans2

    macmenu &File.New\ Tab key=<nop>
    nmap <D-t> :CommandT <CR>

    macmenu &File.Open\ Tab\.\.\. key=<nop>
    map <D-T> :FufFile <CR>

    macmenu &File.Close\ Window key=<nop>
    map <D-W> :Kwbd <CR>
    map <D-r> :FufBuffer <CR>
    map <D-R> :FufLine <CR>

    set fuopt+=maxhorz                      " grow to maximum horizontal width on entering fullscreen mode

endif

