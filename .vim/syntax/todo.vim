" Todo syntax file
" Language:		txt
" Maintainer:		Rayleigh Gamma <https://github.com/rayleigh-gamma>
" Last Change:		2026 Sep 03

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

let s:ft = matchstr(&ft, '^\%([^.]\)\+')

syn match todoAnnotation	display '-\ze\s\['
syn match todoCheckedSection	display '\(\[.\?\]\s\)\@<=.*\ze:\t'
syn match todoCheckedDate	display '\[.*\]'
syn match todoChecked		display '\[x\]'
syn match todoUncheckedContent	display '\(\[\s\]\s\)\@<=.*\ze\['
syn match todoUncheckedSection	display '\(\[ \]\s\)\@<=.*\ze:\t'
syn match todoUncheckedDate	display '\[---\s---\s--\s--:--:--\s----\s-----\s|\sSLOC:\s???\]'
syn match todoUnchecked		display '\[\s\]'

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link todoAnnotation		Statement
hi def link todoCheckedDate		Identifier
hi def link todoChecked			Function
hi def link todoUncheckedDate		Comment
hi def link todoUnchecked		Identifier
hi def link todoUncheckedContent	Identifier

" Define the default highlighting.
hi todoCheckedSection 	cterm=bold
hi todoUncheckedSection	cterm=bold guifg=#a0a0a0

let b:current_syntax = "todo"

unlet s:ft

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8
