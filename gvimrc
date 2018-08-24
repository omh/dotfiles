if has("gui_macvim")
    " Hide all scrollbars and toolbars
    set go-=L
    set guioptions-=r
    set guioptions-=T
    set guioptions-=e

    " Make sure highlighting of current line is off
    set nocursorline

    " Set the font
    "set gfn=Source\ Code\ Pro\ Light:h13
    set guifont=Operator\ Mono:h14

    " Turn on anti alias
    set anti

    " Set Visual Bell, doesn't really work in macvim but it does at
    " least disable the audio bell
    set vb

    " Grow to maximum horizontal width on entering fullscreen mode
    set fuopt+=maxhorz 

    " Allow meta/option key to be mapped to <M-...>
    set macmeta
endif
