" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"



hi clear

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="molokai"

if exists("g:molokai_original")
    let s:molokai_original = g:molokai_original
else
    let s:molokai_original = 0
endif

"
" Support for 256-color terminal
"
if &t_Co > 255
   hi Boolean         ctermfg=208
   hi Character       ctermfg=208
   hi Number          ctermfg=208
   hi String          ctermfg=208
   hi Conditional     ctermfg=161               cterm=bold
   hi Constant        ctermfg=208               cterm=bold
   hi Cursor          ctermfg=16  ctermbg=253
   hi Debug           ctermfg=225               cterm=bold
   hi Define          ctermfg=118
   hi Delimiter       ctermfg=118

   " Old diff?
   hi DiffAdd                     ctermbg=24
   hi DiffChange      ctermfg=181 ctermbg=239
   hi DiffDelete      ctermfg=162 ctermbg=53
   hi DiffText                    ctermbg=102 cterm=bold

   " Diffs I get...
   hi diffAdded       ctermfg=118
   hi diffRemoved     ctermfg=208
   hi diffNewFile     ctermfg=135
   hi diffFile        ctermfg=135
   hi diffLine        ctermfg=135
   hi diffSubname     ctermfg=242

   " Silly Git stuff
   hi gitcommitSummary ctermfg=252
   hi gitcommitBlank  ctermfg=252

   hi Directory       ctermfg=118               cterm=bold
   hi Error           ctermfg=15 ctermbg=161
   hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
   hi Exception       ctermfg=118               cterm=bold
   hi Float           ctermfg=208
   hi FoldColumn      ctermfg=67  ctermbg=16
   hi Folded          ctermfg=67  ctermbg=16
   hi Function        ctermfg=81
   hi Identifier      ctermfg=252
   hi Ignore          ctermfg=244 ctermbg=232
   hi IncSearch       ctermfg=193 ctermbg=16

   hi Keyword         ctermfg=161               cterm=bold
   hi Label           ctermfg=161               cterm=none
   hi Macro           ctermfg=193
   hi SpecialKey      ctermfg=81

   hi MatchParen      ctermfg=16  ctermbg=135 cterm=bold
   hi ModeMsg         ctermfg=229
   hi MoreMsg         ctermfg=229
   hi Operator        ctermfg=135

   " complete menu
   hi Pmenu           ctermfg=81  ctermbg=16
   hi PmenuSel                    ctermbg=244
   hi PmenuSbar                   ctermbg=232
   hi PmenuThumb      ctermfg=81

   hi PreCondit       ctermfg=118               cterm=bold
   hi PreProc         ctermfg=118
   hi Question        ctermfg=81
   hi Repeat          ctermfg=161               cterm=bold
   hi Search          ctermfg=15  ctermbg=33

   " marks column
   hi SignColumn      ctermfg=118 ctermbg=235
   hi SpecialChar     ctermfg=208               cterm=bold
   hi SpecialComment  ctermfg=245               cterm=bold
   hi Special         ctermfg=81  ctermbg=232
   hi SpecialKey      ctermfg=245

   hi Statement       ctermfg=161               cterm=bold
   hi StatusLine      ctermfg=238 ctermbg=253
   hi StatusLineNC    ctermfg=244 ctermbg=232
   hi StorageClass    ctermfg=118
   hi Structure       ctermfg=135
   hi Tag             ctermfg=161
   hi Title           ctermfg=166
   hi Todo            ctermfg=231 ctermbg=232   cterm=underline

   hi Typedef         ctermfg=81
   hi Type            ctermfg=118               cterm=none
   hi Underlined      ctermfg=244               cterm=underline

   hi VertSplit       ctermfg=244 ctermbg=234   cterm=bold
   hi VisualNOS                   ctermbg=238
   hi Visual                      ctermbg=235
   hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
   hi WildMenu        ctermfg=81  ctermbg=16

   hi Normal          ctermfg=252 ctermbg=0
   hi Comment         ctermfg=59
   hi CursorLine                  ctermbg=160   cterm=none
   hi CursorColumn                ctermbg=160
   hi LineNr          ctermfg=250 ctermbg=233
   hi NonText         ctermfg=250 ctermbg=233

"-- Kenny's mods -----------------------------------------
   " Lines too long
   hi ColorColumn     ctermbg=233

   " Javascript
   hi javaScript      ctermfg=252
   hi javaScriptIdentifier ctermfg=118
   hi javaScriptFunction ctermfg=118
   hi javaScriptConditional ctermfg=161
   hi javaScriptLabel ctermfg=161
   hi javaScriptValue ctermfg=208
   hi javaScriptNull  ctermfg=208
   hi javaScriptBoolean ctermfg=208
   hi javaScriptStringD ctermfg=208
   hi javaScriptStringS ctermfg=208
   hi javaScriptOperator ctermfg=135
   hi javaScriptMember ctermfg=81
   hi javaScriptBraces ctermfg=118
   hi javaScriptParens ctermfg=135

   " CSS
   hi cssIEJankProp   ctermfg=88
   hi cssIEJankValue  ctermfg=40
   hi cssImportant    ctermfg=161
   hi cssTagName      ctermfg=226
   hi cssUIAttr       ctermfg=208
   hi cssCommonAttr   ctermfg=208

   " P/HTML
   hi phtmlRegion     ctermfg=226
   hi htmlEvent       ctermfg=81
   hi htmlTag         ctermfg=135
   hi htmlEndTag      ctermfg=81

   " PHP
   hi phpVarSelector  ctermfg=81
   hi phpPrint        ctermfg=135
   hi phpSpecialFunction ctermfg=160
   hi phpStructure    ctermfg=32
   hi phpMemberSelector ctermfg=32

   " Java
   hi javaParenT      ctermfg=135

   " Git Gutter
   hi SignColumn      ctermbg=0
   hi GitGutterAdd    ctermfg=118
   hi GitGutterChange ctermfg=208
   hi GitGutterDelete ctermfg=161
   hi GitGutterChangeDelete ctermfg=208

   " Vim Outliner
   hi OL1             ctermfg=118
   hi OL2             ctermfg=81
   hi OL3             ctermfg=161
   hi OL4             ctermfg=135
   hi OL5             ctermfg=208
   hi OL6             ctermfg=118 ctermbg=241
   hi OL7             ctermfg=81 ctermbg=241
   hi OL8             ctermfg=161 ctermbg=241
   hi OL9             ctermfg=135 ctermbg=241
   hi OL0             ctermfg=208 ctermbg=241

   " ADHOC library function keywords
   hi ADHOCMem        ctermfg=166
   hi ADHOCRef        ctermfg=245
   hi ADHOCData       ctermfg=135
   hi ADHOCLib        ctermfg=81
"---------------------------------------------------------
end
