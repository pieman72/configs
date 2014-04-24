" Vim syntax file :)
" Language:	BOA(L)
" Maintainer:	Kenneth Harvey <kenny@harveyserv.ath.cx>
" Last Change:	2011 Feb 7

" Quit if another syntax was already loaded
if exists("b:current_syntax")
  finish
endif

" Types
syn keyword	BOAtype		int float bool char string arr obj func
syn keyword	BOAfree		free
    hi def link	BOAfree		BOAtype

" Control keywords
syn keyword	BOAcontrol	if else switch for foreach while do in break continue return case default define

" Language keywords
syn keyword	BOAkeyword	server client final

" Literals
syn keyword	BOAnull		null
    hi def link	BOAnull BOAliteral
syn keyword	BOAtruth	true false
    hi def link	BOAtruth BOAliteral

" Non-numbers
syn match	BOAindentifier	"[a-zA-Z_][a-zA-Z0-9_]*"
" Numbers
syn match	BOAinteger	"[0-9][0-9]*"
    hi def link BOAinteger BOAliteral
syn match	BOAdecimal	"[0-9][0-9]*\.[0-9]*"
    hi def link BOAdecimal BOAliteral
syn match	BOAoctal	"\\[0-3][0-9][0-9]"
    hi def link BOAoctal BOAescape
syn match	BOAintErr	"0[0-9][0-9]*"
    hi def link BOAintErr BOAerror
syn match	BOAdecErr	"0[0-9][0-9]*\.[0-9]*"
    hi def link BOAdecErr BOAerror
syn match	BOAoctErr1	"\\[4-9][0-9]*"
    hi def link BOAoctErr1 BOAerror
syn match	BOAoctErr2	"\\[0-3][0-9][0-9][0-9][0-9]*"
    hi def link BOAoctErr2 BOAerror

" Operators
syn cluster	BOAoperators	contains=BOAequalsOp,BOAlessOp,BOAgreaterOp,BOAandOp,BOAorOp,BOAplusOp,BOAminusOp,BOAtimesOp,BOAdivideOp,BOAnotOp,BOApowOp,BOAdotOp
syn match	BOAequalsOp	"="
    hi def link BOAequalsOp BOAoperators
syn match	BOAlessOp	"<"
    hi def link BOAlessOp BOAoperators
syn match	BOAgreaterOp	">"
    hi def link BOAgreaterOp BOAoperators
syn match	BOAandOp	"&"
    hi def link BOAandOp BOAoperators
syn match	BOAorOp		"|"
    hi def link BOAorOp BOAoperators
syn match	BOAplusOp	"+"
    hi def link BOAplusOp BOAoperators
syn match	BOAminusOp	"-"
    hi def link BOAminusOp BOAoperators
syn match	BOAtimesOp	"*"
    hi def link BOAtimesOp BOAoperators
syn match	BOAdivideOp	"/"
    hi def link BOAdivideOp BOAoperators
syn match	BOAnotOp	"!"
    hi def link BOAnotOp BOAoperators
syn match	BOApowOp	"\^"
    hi def link BOApowOp BOAoperators
syn match	BOAdotOp	"\."
    hi def link BOAdotOp BOAoperators

" Strings
syn region 	BOAstring	start=/"/ skip=/\\"/ end=/"/	contains=@BOAstrEscape
    hi def link	BOAstring BOAliteral
syn cluster	BOAstrEscape	contains=BOAslashEscape
syn match	BOAslashEscape	"\\." contained
    hi def link	BOAslashEscape BOAstrEscape

" Comments
syn region	BOAcomment1	start="//" end="$"	contains=@BOAcommentHi
    hi def link	BOAcomment1 BOAcomment
syn region	BOAcomment2	start="/\*" end="\*/"	contains=@BOAcommentHi
    hi def link	BOAcomment2 BOAcomment

" Comment highlights
syn cluster	BOAcommentHi	contains=BOAtodo,BOAappHandles
syn keyword	BOAtodo		contained TODO XXX

" Common library
syn keyword	BOAappHandles	APP RUN CLOSE
    hi def link	BOAappHandles BOAlibrary
syn keyword	BOAclasses	Content Text Shape
    hi def link BOAclasses BOAlibrary

" Define hilight colors
hi def link BOAtype Type
hi def link BOAcontrol Conditional
hi def link BOAoperators Operator
hi def link BOAkeyword PreProc
hi def link BOAliteral Constant
hi def link BOAescape SpecialChar
hi def link BOAstrEscape SpecialChar
hi def link BOAcomment Comment
hi def link BOAtodo Todo
hi def link BOAlibrary Identifier
hi def link BOAerror Error
