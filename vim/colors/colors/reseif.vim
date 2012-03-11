" Vim color file
" Converted from Textmate theme Resesif using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Resesif"

hi Cursor ctermfg=NONE ctermbg=15 cterm=NONE guifg=NONE guibg=#ffffff gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#545d73 gui=NONE
hi WildMenu ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#545d73 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3e3d3d gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3e3d3d gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3e3d3d gui=NONE
hi LineNr ctermfg=102 ctermbg=237 cterm=NONE guifg=#898684 guibg=NONE gui=NONE
hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE guifg=#61605e guibg=#61605e gui=NONE
hi MatchParen ctermfg=143 ctermbg=NONE cterm=NONE guifg=#b6c34d guibg=NONE gui=NONE
hi StatusLine ctermfg=188 ctermbg=241 cterm=bold guifg=#e6e1dc guibg=#61605e gui=bold
hi StatusLineNC ctermfg=188 ctermbg=241 cterm=NONE guifg=#e6e1dc guibg=#61605e gui=NONE
hi Pmenu ctermfg=167 ctermbg=52 cterm=NONE guifg=#e16c5b guibg=#3a2e2d gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#545d73 gui=NONE
hi IncSearch ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#595d36 gui=NONE
hi Search ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#595d36 gui=NONE
hi Directory ctermfg=138 ctermbg=59 cterm=NONE guifg=#c29b7a guibg=#393431 gui=NONE
hi Folded ctermfg=245 ctermbg=235 cterm=NONE guifg=#8b8b8b guibg=#2b2b2b gui=NONE

hi Normal ctermfg=188 ctermbg=235 cterm=NONE guifg=#e6e1dc guibg=#2b2b2b gui=NONE
hi Boolean ctermfg=74 ctermbg=NONE cterm=NONE guifg=#71bacc guibg=NONE gui=NONE
hi Character ctermfg=138 ctermbg=59 cterm=NONE guifg=#c29b7a guibg=#393431 gui=NONE
hi Comment ctermfg=245 ctermbg=NONE cterm=NONE guifg=#8b8b8b guibg=NONE gui=italic
hi Conditional ctermfg=143 ctermbg=NONE cterm=NONE guifg=#b6c34d guibg=NONE gui=NONE
hi Constant ctermfg=138 ctermbg=59 cterm=NONE guifg=#c29b7a guibg=#393431 gui=NONE
hi Define ctermfg=143 ctermbg=NONE cterm=NONE guifg=#b6c34d guibg=NONE gui=NONE
hi ErrorMsg ctermfg=15 ctermbg=88 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
hi WarningMsg ctermfg=15 ctermbg=88 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
hi Float ctermfg=146 ctermbg=59 cterm=NONE guifg=#b49cda guibg=#353338 gui=NONE
hi Function ctermfg=167 ctermbg=52 cterm=NONE guifg=#e16c5b guibg=#3a2e2d gui=NONE
"hi Identifier ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e8bf6a guibg=NONE gui=NONE
hi Identifier ctermfg=179 ctermbg=NONE cterm=NONE guifg=#4DA6BD guibg=#2b3031 gui=NONE
hi Keyword ctermfg=143 ctermbg=NONE cterm=NONE guifg=#b6c34d guibg=NONE gui=NONE
hi Label ctermfg=149 ctermbg=236 cterm=NONE guifg=#b0cc66 guibg=#31322d gui=NONE
hi NonText ctermfg=238 ctermbg=236 cterm=NONE guifg=#404040 guibg=#343434 gui=NONE
hi Number ctermfg=146 ctermbg=59 cterm=NONE guifg=#b49cda guibg=#353338 gui=NONE
hi Operator ctermfg=143 ctermbg=NONE cterm=NONE guifg=#b6c34d guibg=NONE gui=NONE
hi PreProc ctermfg=143 ctermbg=NONE cterm=NONE guifg=#b6c34d guibg=NONE gui=NONE
hi Special ctermfg=188 ctermbg=NONE cterm=NONE guifg=#e6e1dc guibg=NONE gui=NONE

hi phpFunctions ctermfg=188 ctermbg=NONE cterm=NONE guifg=#D98339 guibg=NONE gui=NONE
hi phpSpecialFunction ctermfg=188 ctermbg=NONE cterm=NONE guifg=#D98339 guibg=NONE gui=NONE
hi phpSpecialMethods ctermfg=188 ctermbg=NONE cterm=NONE guifg=#D98339 guibg=NONE gui=NONE
hi phpDefineMethod ctermfg=188 ctermbg=NONE cterm=NONE guifg=#e8bf6a guibg=NONE gui=NONE
hi phpIdentifier ctermfg=188 ctermbg=NONE cterm=NONE guifg=#4DA6BD guibg=#2b3031 gui=NONE
hi phpVarSelector ctermfg=188 ctermbg=NONE cterm=NONE guifg=#4DA6BD guibg=#2b3031 gui=NONE
hi phpMemberHere ctermfg=188 ctermbg=NONE cterm=NONE guifg=#4DA6BD guibg=#2b3031 gui=NONE
hi phpSuperGlobal ctermfg=188 ctermbg=NONE cterm=NONE guifg=#4DA6BD guibg=#2b3031 gui=NONE
hi phpDefineClassName ctermfg=167 ctermbg=52 cterm=NONE guifg=#e16c5b guibg=#3a2e2d gui=NONE
hi phpDefineMethodName ctermfg=167 ctermbg=52 cterm=NONE guifg=#e16c5b guibg=#3a2e2d gui=NONE
"hi phpSpecialMethods ctermfg=167 ctermbg=52 cterm=NONE guifg=#e16c5b guibg=#3a2e2d gui=NONE
hi phpMemberSelector ctermfg=143 ctermbg=NONE cterm=NONE guifg=#b6c34d guibg=NONE gui=NONE
hi phpType ctermfg=143 ctermbg=NONE cterm=NONE guifg=#c29b7a guibg=#393431 gui=NONE
hi phpBraceClass ctermfg=143 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi phpBraceFunc ctermfg=143 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi phpStructure ctermfg=188 ctermbg=NONE cterm=NONE guifg=#e8bf6a guibg=NONE gui=NONE
hi gitcommitSummary ctermfg=188 ctermbg=NONE cterm=NONE guifg=#e8bf6a guibg=NONE gui=NONE

hi SpecialKey ctermfg=238 ctermbg=237 cterm=NONE guifg=#404040 guibg=#3e3d3d gui=NONE
hi Statement ctermfg=143 ctermbg=NONE cterm=NONE guifg=#b6c34d guibg=NONE gui=NONE
hi StorageClass ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e8bf6a guibg=NONE gui=NONE
hi String ctermfg=149 ctermbg=236 cterm=NONE guifg=#b0cc66 guibg=#31322d gui=NONE
hi Tag ctermfg=167 ctermbg=52 cterm=NONE guifg=#e16c5b guibg=#3a2e2d gui=NONE
hi Title ctermfg=188 ctermbg=NONE cterm=bold guifg=#e6e1dc guibg=NONE gui=bold
hi Todo ctermfg=245 ctermbg=NONE cterm=inverse,bold guifg=#8b8b8b guibg=NONE gui=inverse,bold
hi Type ctermfg=167 ctermbg=52 cterm=NONE guifg=#e16c5b guibg=#3a2e2d gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=143 ctermbg=NONE cterm=NONE guifg=#b6c34d guibg=NONE gui=NONE
hi rubyFunction ctermfg=167 ctermbg=52 cterm=NONE guifg=#e16c5b guibg=#3a2e2d gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=138 ctermbg=59 cterm=NONE guifg=#c29b7a guibg=#393431 gui=NONE
hi rubyConstant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=149 ctermbg=236 cterm=NONE guifg=#b0cc66 guibg=#31322d gui=NONE
hi rubyBlockParameter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=185 ctermbg=NONE cterm=NONE guifg=#dbd76b guibg=NONE gui=NONE
hi rubyInclude ctermfg=143 ctermbg=NONE cterm=NONE guifg=#b6c34d guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=73 ctermbg=23 cterm=NONE guifg=#4da6bd guibg=#2b3031 gui=NONE
hi rubyRegexp ctermfg=149 ctermbg=236 cterm=NONE guifg=#b0cc66 guibg=#31322d gui=NONE
hi rubyRegexpDelimiter ctermfg=149 ctermbg=236 cterm=NONE guifg=#b0cc66 guibg=#31322d gui=NONE
hi rubyEscape ctermfg=71 ctermbg=NONE cterm=NONE guifg=#3fc172 guibg=NONE gui=NONE
hi rubyControl ctermfg=143 ctermbg=NONE cterm=NONE guifg=#b6c34d guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=143 ctermbg=NONE cterm=NONE guifg=#b6c34d guibg=NONE gui=NONE
hi rubyException ctermfg=143 ctermbg=NONE cterm=NONE guifg=#b6c34d guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=185 ctermbg=NONE cterm=NONE guifg=#dbd76b guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=173 ctermbg=NONE cterm=NONE guifg=#d98339 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=173 ctermbg=NONE cterm=NONE guifg=#d98339 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=173 ctermbg=NONE cterm=NONE guifg=#d98339 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=173 ctermbg=NONE cterm=NONE guifg=#d98339 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=245 ctermbg=NONE cterm=NONE guifg=#8b8b8b guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=173 ctermbg=NONE cterm=NONE guifg=#d98339 guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=138 ctermbg=59 cterm=NONE guifg=#c29b7a guibg=#393431 gui=NONE
hi javaScriptFunction ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e8bf6a guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=173 ctermbg=NONE cterm=NONE guifg=#d98339 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=167 ctermbg=52 cterm=NONE guifg=#e16c5b guibg=#3a2e2d gui=NONE
hi yamlAnchor ctermfg=73 ctermbg=23 cterm=NONE guifg=#4da6bd guibg=#2b3031 gui=NONE
hi yamlAlias ctermfg=73 ctermbg=23 cterm=NONE guifg=#4da6bd guibg=#2b3031 gui=NONE
hi yamlDocumentHeader ctermfg=149 ctermbg=236 cterm=NONE guifg=#b0cc66 guibg=#31322d gui=NONE
hi cssURL ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssFunctionName ctermfg=173 ctermbg=NONE cterm=NONE guifg=#d98339 guibg=NONE gui=NONE
hi cssColor ctermfg=138 ctermbg=59 cterm=NONE guifg=#c29b7a guibg=#393431 gui=NONE
hi cssPseudoClassId ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssClassName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssValueLength ctermfg=146 ctermbg=59 cterm=NONE guifg=#b49cda guibg=#353338 gui=NONE
hi cssCommonAttr ctermfg=149 ctermbg=NONE cterm=NONE guifg=#bbc94d guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
