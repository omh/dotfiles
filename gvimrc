if has("gui_macvim")
    " Hide all scrollbars and toolbars
    set go-=L
    set guioptions-=r
    set guioptions-=T

    " Turn on highlighting of current line
    set nocursorline

    set gfn=Monaco:h10
    "set gfn=Menlo:h10
    "set linespace=3

    " Turn on anti alias
    set anti

    "colorscheme jellybeans2
    "colorscheme zenburn3
    colorscheme reseif

    macmenu &File.Open\ Tab\.\.\. key=<nop>
    map <D-T> :FufFile <CR>

    macmenu &File.Close\ Window key=<nop>
    map <D-W> :Kwbd <CR>
    map <D-r> :FufBuffer <CR>
    map <D-R> :FufLine <CR>

    set fuopt+=maxhorz                      " grow to maximum horizontal width on entering fullscreen mode
    highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

endif

