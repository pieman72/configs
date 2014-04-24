set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "kenny"
nmap <C-S-A> :w<CR> :colors kenny<CR>

highlight Todo ctermfg=0 ctermbg=3 cterm=none

"TODO
"0	^Black^
"1	^Red^
"2	^Green^
"3	^Yellow^
"4	^Blue^
"5	^Purple^
"6	^Teal^
"7	^White^
