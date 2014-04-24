" Vim syntax file :)
" Language:	Plain Text
" Maintainer:	Kenneth Harvey <kenny@harveyserv.ath.cx>
" Last Change:	2011 Feb 17

" Quit if another syntax was already loaded
if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword	TxtOLIO	OLIOLIO

" URLs
syn match	TxtURL		"\(\([a-zA-Z0-9_]\|%[0-9A-F]{2}\)\+\.\)\+com\(/\([a-zA-Z0-9_.]\|%[0-9A-F]{2}\)\+\)*\(/\)\?"

" XML Tags
syn match	TxtTag		"<[^>]*>" contains=TxtEm

" Bracketed items
syn match	TxtBracket	"\[[^\]]*]" contains=TxtEm

" Major Headings
syn match	TxtHeading	"\*\*\*[^*]*\*\*\*" contains=TxtEm

" Comments
syn region	TxtComment1	start="//" end="$"	contains=@TxtCommentHi keepend
    hi def link	TxtComment1 TxtComment
syn region	TxtComment2	start="/\*" end="\*/"	contains=@TxtCommentHi
    hi def link	TxtComment2 TxtComment

" Comment highlights
syn cluster	TxtCommentHi	contains=TxtTodo,TxtEm,TxtTag,TxtBracket,TxtURL
syn keyword	TxtTodo		contained TODO XXX

" Define hilight colors
hi def link TxtOLIO Error
hi def link TxtTag Operator
hi def link TxtBracket Label
hi def link TxtHeading Type
hi def link TxtComment Comment
hi def link TxtTodo Todo
hi TxtURL	term=underline	cterm=underline ctermfg=4* ctermbg=none	gui=underline guifg=none guibg=none
