" Vim syntax file
" Language:	eZ Publish Templates
" Maintainer:   damien pobel dpobel@free.fr
" Last Change:  Mon Jan  13 12:11:23 CET 2009
" Filenames:    *.tpl
" URL:		http://projects.ez.no/ezvim

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
  finish
endif
  let main_syntax = 'ezp'
endif

syn case ignore

runtime! syntax/html.vim

" needed to recognize cache-block, set-block, $node, ...
set isk+=-
set isk+=$

syn keyword ezpFunction include
syn keyword ezpFunction attribute_edit_gui
syn keyword ezpFunction attribute_pdf_gui
syn keyword ezpFunction attribute_result_gui
syn keyword ezpFunction attribute_view_gui
syn keyword ezpFunction class_attribute_edit_gui
syn keyword ezpFunction class_attribute_view_gui
syn keyword ezpFunction collaboration_icon
syn keyword ezpFunction collaboration_participation_view
syn keyword ezpFunction collaboration_simple_message_view
syn keyword ezpFunction collaboration_view_gui
syn keyword ezpFunction content_pdf_gui
syn keyword ezpFunction content_version_view_gui
syn keyword ezpFunction content_view_gui
syn keyword ezpFunction event_edit_gui
syn keyword ezpFunction node_view_gui
syn keyword ezpFunction related_view_gui
syn keyword ezpFunction shop_account_view_gui
syn keyword ezpFunction tool_bar
syn keyword ezpFunction fetch cache-block set-block append-block

syn keyword ezpConditional if elseif else ldelim rdelim literal
syn keyword ezpConditional section foreach section-else
syn keyword ezpLabel switch case

syn keyword ezpKeyword upper wordwrap concat simplify trim shorten autolink
syn keyword ezpKeyword explode extract_right begins_with
syn keyword ezpKeyword wash ezurl ezdesign ezimage ezroot datetime
syn keyword ezpKeyword true false is_set def set undef default l10n i18n si let set
syn keyword ezpKeyword hash array ezini
syn keyword ezpKeyword merge "contains" append array array_sum compare
syn keyword ezpKeyword ends_with explode extract extract_left
syn keyword ezpKeyword implode prepend remove repeat reverse unique

syn keyword ezpKeyword currentdate
syn keyword ezpKeyword is_set def set undef default l10n i18n si let set
syn keyword ezpKeyword ezhttp_hasvariable
syn keyword ezpKeyword ezini_hasvariable
syn keyword ezpKeyword ezmodule
syn keyword ezpKeyword ezpreference
syn keyword ezpKeyword ezsys
syn keyword ezpKeyword module_params

syn keyword ezpKeyword image
syn keyword ezpKeyword imagefile
syn keyword ezpKeyword texttoimage
syn keyword ezpKeyword and
syn keyword ezpKeyword choose
syn keyword ezpKeyword cond
syn keyword ezpKeyword first_set

syn keyword ezpKeyword not
syn keyword ezpKeyword null
syn keyword ezpKeyword or
syn keyword ezpBoolean true
syn keyword ezpBoolean false

syn keyword ezpOperator eq
syn keyword ezpOperator ge
syn keyword ezpOperator gt
syn keyword ezpOperator le
syn keyword ezpOperator lt
syn keyword ezpOperator ne
syn keyword ezpOperator inc
syn keyword ezpOperator div
syn keyword ezpOperator sub
syn keyword ezpOperator sum

syn keyword ezpKeyword abs
syn keyword ezpKeyword ceil
syn keyword ezpKeyword dec
syn keyword ezpKeyword floor
syn keyword ezpKeyword max
syn keyword ezpKeyword min
syn keyword ezpKeyword mod
syn keyword ezpKeyword mul
syn keyword ezpKeyword rand
syn keyword ezpKeyword round

syn keyword ezpKeyword action_icon
syn keyword ezpKeyword attribute
syn keyword ezpKeyword classgroup_icon
syn keyword ezpKeyword class_icon
syn keyword ezpKeyword content_structure_tree
syn keyword ezpKeyword ezpackage
syn keyword ezpKeyword flag_icon
syn keyword ezpKeyword gettime
syn keyword ezpKeyword icon_info
syn keyword ezpKeyword makedate
syn keyword ezpKeyword maketime
syn keyword ezpKeyword mimetype_icon
syn keyword ezpKeyword month_overview
syn keyword ezpKeyword pdf
syn keyword ezpKeyword roman
syn keyword ezpKeyword topmenu
syn keyword ezpKeyword treemenu

syn keyword ezpKeyword append
syn keyword ezpKeyword autolink
syn keyword ezpKeyword begins_with
syn keyword ezpKeyword break
syn keyword ezpKeyword chr
syn keyword ezpKeyword compare
syn keyword ezpKeyword concat
syn keyword ezpKeyword contains
syn keyword ezpKeyword count_chars
syn keyword ezpKeyword count_words
syn keyword ezpKeyword crc32
syn keyword ezpKeyword downcase
syn keyword ezpKeyword ends_with
syn keyword ezpKeyword explode
syn keyword ezpKeyword extract
syn keyword ezpKeyword extract left
syn keyword ezpKeyword extract_right
syn keyword ezpKeyword indent
syn keyword ezpKeyword insert
syn keyword ezpKeyword md5
syn keyword ezpKeyword nl2br
syn keyword ezpKeyword ord
syn keyword ezpKeyword pad
syn keyword ezpKeyword prepend
syn keyword ezpKeyword remove
syn keyword ezpKeyword repeat
syn keyword ezpKeyword reverse
syn keyword ezpKeyword rot13
syn keyword ezpKeyword shorten
syn keyword ezpKeyword simpletags
syn keyword ezpKeyword simplify
syn keyword ezpKeyword trim
syn keyword ezpKeyword upcase
syn keyword ezpKeyword upfirst
syn keyword ezpKeyword upword
syn keyword ezpKeyword wash
syn keyword ezpKeyword wordtoimage
syn keyword ezpKeyword wrap

syn keyword ezpKeyword count
syn keyword ezpKeyword float
syn keyword ezpKeyword get_class
syn keyword ezpKeyword get_type
syn keyword ezpKeyword int
syn keyword ezpKeyword is_array
syn keyword ezpKeyword is_boolean
syn keyword ezpKeyword is_class
syn keyword ezpKeyword is_float
syn keyword ezpKeyword is_integer
syn keyword ezpKeyword is_null
syn keyword ezpKeyword is_numeric
syn keyword ezpKeyword is_object
syn keyword ezpKeyword is_set
syn keyword ezpKeyword is_string
syn keyword ezpKeyword is_unset

syn keyword ezpDot .

syn region ezpZone matchgroup=Delimiter start="{" end="}" contains=ezpBlock, ezpFunction, ezpInFunc, ezpKeyword, ezpConditional, ezpLabel, ezpDot, ezpProperty, ezpVariables, ezpSpecialVariables, ezpBoolean, ezpOperator
syn region ezpComment matchgroup=Delimiter start="{\*\**" end="\**\*}"
syn region ezpLiteral matchgroup=Delimiter start="{literal}" end="{/literal}"

syn region ezpString start=+"+ end=+"+ containedin=ezpZone
syn region ezpString start="'" end="'" containedin=ezpZone

syn match ezpVariables "\$[^ =\|\[\]},]*" containedin=ezpZone
syn match ezpSpecialVariables "\$node[^ |},]*" containedin=ezpZone
syn match ezpSpecialVariables "\$module_result[^ |},]*" containedin=ezpZone
syn match ezpSpecialVariables "\$view_parameters[^ |},]*" containedin=ezpZone

syn region  htmlString   contained start=+"+ end=+"+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc,ezpZone
syn region  htmlString   contained start=+'+ end=+'+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc,ezpZone
syn region htmlLink start="<a\>\_[^>]*\<href\>" end="</a>"me=e-4 contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,javaScript,@htmlPreproc,ezpZone

" to avoid special colors in <head></head> section
syn clear htmlHead

syn clear cssStyle
syn region cssStyle start=+<style+ keepend end=+</style>+ contains=@htmlCss,htmlTag,htmlEndTag,htmlCssStyleComment,@htmlPreproc,ezpZone

if version >= 508 || !exists("did_ezp_syn_inits")
  if version < 508
    let did_ezp_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  if !exists('ezp_my_rendering')
      hi def ezpStyleVariable        term=bold cterm=bold gui=bold
      hi def ezpStyleSpecialVariable term=bold cterm=bold gui=bold
  endif

  HiLink ezpProperty Constant
  HiLink ezpLiteral PreProc
  HiLink ezpInFunc Function
  HiLink ezpBlock Constant
  HiLink ezpDot Character
  HiLink ezpKeyword Keyword
  HiLink ezpFunction Function
  HiLink ezpOperator Constant
  HiLink ezpConditional Conditional
  HiLink ezpLabel Label
  HiLink ezpBoolean Boolean
  HiLink ezpComment Comment
  " Uncomment to make all variables in bold
  HiLink ezpVariables Identifier
  HiLink ezpSpecialVariables Identifier
  " Uncomment to make all string colored
  HiLink ezpString String
  delcommand HiLink
endif

let b:current_syntax = "ezp"

if main_syntax == 'ezp'
  unlet main_syntax
endif

" vim: ts=4
