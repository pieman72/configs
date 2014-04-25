" Palette object
let g:airline#themes#molokai#palette = {}
let g:airline#themes#molokai#palette.accents = { 'red': [ '#ee0000' , '' , 160 , '' , '' ], }


" Normal mode
let s:N1 = ['#ffffff', '#000000', 255, 235] " a,z
let s:N2 = ['#ffffff', '#000000',  16,  59] " b,y
let s:N3 = ['#ffffff', '#000000', 255, 235] " c,x
let s:Nm = ['#ffffff', '#000000', 161, 235] " modified
let g:airline#themes#molokai#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#molokai#palette.normal_modified = airline#themes#generate_color_map(s:N1, s:N2, s:Nm)


" Insert mode
let s:I1 = ['#ffffff', '#000000',  16, 135] " a,z
let s:I2 = ['#ffffff', '#000000',  16,  59] " b,y
let s:I3 = ['#ffffff', '#000000', 255, 235] " c,x
let s:Im = ['#ffffff', '#000000', 161, 235] " modified
let g:airline#themes#molokai#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#molokai#palette.insert_modified = airline#themes#generate_color_map(s:I1, s:I2, s:Im)


" Replace mode
let s:R1 = ['#ffffff', '#000000',  16, 208] " a,z
let s:R2 = ['#ffffff', '#000000',  16,  59] " b,y
let s:R3 = ['#ffffff', '#000000', 255, 235] " c,x
let s:Rm = ['#ffffff', '#000000', 161, 235] " modified
let g:airline#themes#molokai#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#molokai#palette.replace_modified = airline#themes#generate_color_map(s:R1, s:R2, s:Rm)


" Visual mode
let s:V1 = ['#ffffff', '#000000',  16, 118] " a,z
let s:V2 = ['#ffffff', '#000000',  16,  59] " b,y
let s:V3 = ['#ffffff', '#000000', 255, 235] " c,x
let s:Vm = ['#ffffff', '#000000', 161, 235] " modified
let g:airline#themes#molokai#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#molokai#palette.visual_modified = airline#themes#generate_color_map(s:V1, s:V2, s:Vm)


" Inactive
let s:IA =  ['#ffffff', '#000000', 251, 235] " monochrome
let s:IAm = ['#ffffff', '#000000', 161, 235] " modified
let g:airline#themes#molokai#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#molokai#palette.inactive_modified = airline#themes#generate_color_map(s:IA, s:IA, s:IAm)
