" Vim color file
" Maintainer:   Jani Nurminen <slinky@iki.fi>
" Last Change:  $Id: zenburn.vim,v 2.3 2008/07/30 17:34:37 slinky Exp $
" URL:      	http://slinky.imukuppi.org/zenburnpage/
" License:      GPL
"
" Nothing too fancy, just some alien fruit salad to keep you in the zone.
" This syntax file was designed to be used with dark environments and 
" low light situations. Of course, if it works during a daybright office, go
" ahead :)
"
" Owes heavily to other Vim color files! With special mentions
" to "BlackDust", "Camo" and "Desert".
"
" To install, copy to ~/.vim/colors directory. Then :colorscheme zenburn.  
" See also :help syntax
"
" Credits:
"  - Jani Nurminen - original Zenburn
"  - Steve Hall & Cream posse - higher-contrast Visual selection
"  - Kurt Maier - 256 color console coloring, low and high contrast toggle,
"                 bug fixing
"  - Charlie - spotted too bright StatusLine in non-high contrast mode
"  - Pablo Castellazzi - CursorLine fix for 256 color mode
"
" CONFIGURABLE PARAMETERS:
" 
" You can use the default (don't set any parameters), or you can
" set some parameters to tweak the Zenburn colours.
"
" * You can now set a darker background for bright environments. To activate, use:
"   contrast Zenburn, use:
"
"      let g:zenburn_high_Contrast = 1
"
" * To get more contrast to the Visual selection, use
"   
"      let g:zenburn_alternate_Visual = 1
" 
" * To use alternate colouring for Error message, use
"     
"      let g:zenburn_alternate_Error = 1
"
" * The new default for Include is a duller orange. To use the original
"   colouring for Include, use
"     
"      let g:zenburn_alternate_Include = 1
"
" * To turn the parameter(s) back to defaults, use UNLET:
"
"      unlet g:zenburn_alternate_Include
"
"   Setting to 0 won't work!
"
" That's it, enjoy!
" 
" TODO
"   - Visual alternate color is broken? Try GVim >= 7.0.66 if you have trouble
"   - IME colouring (CursorIM)

set background=dark
hi clear          
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="zenburn"

hi Boolean         guifg=#dca3a3
hi Character       guifg=#dca3a3 gui=NONE
"hi Comment         guifg=#7f9f7f gui=italic
hi Comment         guifg=#9F9F9F gui=italic
hi Conditional     guifg=#f0dfaf gui=NONE
hi Constant        guifg=#dca3a3 gui=NONE
hi Cursor          guifg=#000d18 guibg=#8faf9f gui=NONE
hi Debug           guifg=#bca3a3 gui=NONE
hi Define          guifg=#ffcfaf gui=NONE
hi Delimiter       guifg=#8f8f8f
"hi DiffAdd         guifg=#709080 guibg=#313c36 gui=bold
hi DiffChange      guibg=#333333
"hi DiffDelete      guifg=#333333 guibg=#464646
hi DiffText        guifg=#ecbcbc guibg=#41363c gui=bold
hi DiffAdd      guifg=#5DF224 guibg=NONE
hi DiffDelete   guifg=#E82619 guibg=NONE
"hi Directory       guifg=#f0dfaf gui=NONE
hi Directory       guifg=#8c8cbc gui=NONE
hi ErrorMsg        guifg=#80d4aa guibg=#2f2f2f gui=NONE
hi Exception       guifg=#c3bf9f gui=NONE
hi Float           guifg=#c0bed1
hi FoldColumn      guifg=#93b3a3 guibg=#3f4040
hi Folded          guifg=#93b3a3 guibg=#3f4040
hi Function        guifg=#efef8f
hi Function        guifg=#82a282
hi Identifier      guifg=#efdcbc
hi IncSearch       guibg=#f8f893 guifg=#385f38
hi Keyword         guifg=#f0dfaf gui=NONE
hi Label           guifg=#dfcfaf gui=underline
"hi LineNr          guifg=#9fafaf guibg=#262626
hi LineNr          guifg=#333333 guibg=NONE
hi Macro           guifg=#ffcfaf gui=NONE
hi ModeMsg         guifg=#ffcfaf gui=none
hi MoreMsg         guifg=#ffffff gui=NONE
hi NonText         guifg=#404040
hi Number          guifg=#8cd0d3
hi Operator        guifg=#f0efd0
hi PreCondit       guifg=#dfaf8f gui=bold
hi PreProc         guifg=#ffcfaf gui=bold
hi Question        guifg=#ffffff gui=bold
hi Repeat          guifg=#ffd7a7 gui=bold
hi Search          guifg=#ffffe0 guibg=#284f28
hi SpecialChar     guifg=#dca3a3 gui=bold
hi SpecialComment  guifg=#82a282 gui=bold
hi Special         guifg=#cfbfaf
hi SpecialKey      guifg=#9ece9e
hi Statement       guifg=#e3ceab gui=none
hi StatusLine      guifg=#313633 guibg=#ccdc90
hi StatusLineNC    guifg=#2e3330 guibg=#88b090
hi StorageClass    guifg=#c3bf9f gui=bold
hi String          guifg=#cc9393
hi Structure       guifg=#efefaf gui=bold
hi Tag             guifg=#e89393 gui=bold
hi Title           guifg=#efefef gui=bold
hi Todo            guifg=#dfdfdf guibg=bg gui=bold
hi Typedef         guifg=#dfe4cf gui=NONE
hi Type            guifg=#dfdfbf gui=NONE
hi Underlined      guifg=#dcdccc gui=underline
hi VertSplit       guifg=#2e3330 guibg=#688060
hi VisualNOS       guifg=#333333 guibg=#f18c96 gui=bold,underline
hi WarningMsg      guifg=#ffffff guibg=#333333 gui=bold
hi WildMenu        guibg=#2c302d guifg=#cbecd0 gui=underline

hi SpellBad   guisp=#bc6c4c guifg=#dc8c6c
hi SpellCap   guisp=#6c6c9c guifg=#8c8cbc
hi SpellRare  guisp=#bc6c9c guifg=#bc8cbc
hi SpellLocal guisp=#7cac7c guifg=#9ccc9c

if exists("g:zenburn_high_Contrast")
    " use new darker background
    hi Normal          guifg=#dcdccc guibg=#1f1f1f
    hi CursorLine      guibg=#121212 gui=bold
    hi Pmenu           guibg=#242424 guifg=#ccccbc
    hi PMenuSel        guibg=#353a37 guifg=#ccdc90 gui=bold
    hi PmenuSbar       guibg=#2e3330 guifg=#000000
    hi PMenuThumb      guibg=#a0afa0 guifg=#040404 
    hi MatchParen      guifg=#f0f0c0 guibg=#383838 gui=bold
    hi SignColumn      guifg=#9fafaf guibg=#181818 gui=bold
    hi TabLineFill     guifg=#cfcfaf guibg=#181818 gui=bold
    hi TabLineSel      guifg=#efefef guibg=#1c1c1b gui=bold
    hi TabLine         guifg=#b6bf98 guibg=#181818 gui=bold
    hi CursorColumn    guifg=#dcdccc guibg=#2b2b2b
else
    " Original, lighter background
    hi Normal          guifg=#dcdccc guibg=#3f3f3f
    hi CursorLine      guibg=#434443
    hi Pmenu           guibg=#2c2e2e guifg=#9f9f9f
    hi PMenuSel        guibg=#242424 guifg=#d0d0a0 gui=bold
    hi PmenuSbar       guibg=#2e3330 guifg=#000000
    hi PMenuThumb      guibg=#a0afa0 guifg=#040404 
    hi MatchParen      guifg=#b2b2a0 guibg=#2e2e2e gui=bold
    hi SignColumn      guifg=#9fafaf guibg=#343434 gui=bold
    hi TabLineFill     guifg=#cfcfaf guibg=#353535 gui=bold
    hi TabLineSel      guifg=#efefef guibg=#3a3a39 gui=bold
    hi TabLine         guifg=#b6bf98 guibg=#353535 gui=bold
    hi CursorColumn    guifg=#dcdccc guibg=#4f4f4f
endif
    

if exists("g:zenburn_alternate_Visual")
    " Visual with more contrast, thanks to Steve Hall & Cream posse
    " gui=none fixes weird highlight problem in at least GVim 7.0.66, thanks to Kurt Maier
    hi Visual          guifg=#000000 guibg=#71d3b4 gui=none
    hi VisualNOS       guifg=#000000 guibg=#71d3b4 gui=none
else
    " use default visual
    "hi Visual          guifg=#233323 guibg=#71d3b4 gui=none
    hi Visual guifg=#ffffff       guibg=#606070       gui=NONE
    hi VisualNOS       guifg=#233323 guibg=#71d3b4 gui=none
endif

if exists("g:zenburn_alternate_Error")
    " use a bit different Error
    hi Error           guifg=#ef9f9f guibg=#201010 gui=bold  
else
    " default
    hi Error           guifg=#e37170 guibg=#332323 gui=none
endif

if exists("g:zenburn_alternate_Include")
    " original setting
    hi Include         guifg=#ffcfaf gui=bold
else
    " new, less contrasted one
    hi Include         guifg=#dfaf8f gui=bold
endif
    " TODO check for more obscure syntax groups that they're ok

" Ruby Styles
hi rubyInstanceVariable guifg=#948369 guibg=NONE    gui=NONE

" PHP Styles
hi phpQuoteSingle       guifg=#905E5E
hi phpQuoteDouble       guifg=#905E5E
hi phpSpecialMethods    guifg=#D4D5C0

hi phpMemberHere        guifg=#EDEDC4
hi phpMethodHere        guifg=#EDEDC4
hi phpMethodHere        guifg=#EDEDC4
hi phpPropertyHere      guifg=#EDEDC4
hi phpStaticCall        guifg=#EDEDC4

" CSS Styles 
hi cssMediaComma        guifg=#905E5E

hi markdownCode guifg=#888888 gui=italic
hi markdownCodeBlock guifg=#888888 gui=italic
hi markdownH3 guifg=#99ad6a
hi markdownH4 guifg=#99ad6a


hi CtrlPMatch guifg=#8c8cbc
hi LustySelected guifg=#8c8cbc
