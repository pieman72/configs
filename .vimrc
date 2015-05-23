" ==============================================================================
" ===                                 PATHS                                  ===
" ==============================================================================

" Set home path
let $HOME="/home/".$USER."/"

" Set leader input
let mapleader = ","


" ==============================================================================
" ===                                PLUGINS                                 ===
" ==============================================================================

" Set up Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage plugins
Bundle 'gmarik/vundle'
Bundle 'majutsushi/tagbar'
Bundle 'vimoutliner/vimoutliner'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'tristen/vim-sparkup'
Bundle 'marijnh/tern_for_vim'
Bundle 'pieman72/vim-vigor'
call vundle#end()

" Config for tagbar
let g:tagbar_map_togglefold = "<space>"
let g:tagbar_map_showproto = "<right>"
let g:tagbar_autoclose = 0

" Config for syntastic
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_checkers=['clang']
let g:syntastic_php_checkers = ['php']

" Config for GitGutter
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_modified_removed = '±'

" Config for vim airline
set noshowmode                     " -- Hide default mode indicator
set laststatus=2                   " -- Show airline even with only one split
let g:airline_theme = 'molokai'    " -- Airline color theme
function! AirlineInit()
	try
		if has("multi_byte")
			set termencoding=utf-8
			set encoding=utf-8
			let g:airline_powerline_fonts = 1  " -- Allow fancy separators
			let g:airline_left_sep = "\ue0b0"
			let g:airline_right_sep = "\ue0b2"
			let g:airline_symbols.readonly = "\ue0a2"
		else
			let g:airline_powerline_fonts = 0  " -- No fancy separators
		endif
		let g:airline#extensions#tagbar#enabled = 1     " -- Integrate with tagbar
		let g:airline#extensions#syntastic#enabled = 1  " -- Integrate with syntastic
		let g:airline#extensions#fugitive#enabled = 1   " -- Integrate with tagbar
		let g:airline_section_a = airline#section#create(['mode'])
		let g:airline_section_b = airline#section#create(["%{airline#extensions#branch#get_head()}"])
		let g:airline_section_c = airline#section#create(['file',' (','filetype',')'])
		let g:airline_section_x = airline#section#create(["\ue0a1%l \ue0a3%c"])
		let g:airline_section_y = airline#section#create(["%{airline#extensions#tagbar#currenttag()}"])
		let g:airline_section_z = airline#section#create(["%{airline#parts#ffenc()}"])
		let g:airline_section_warning = airline#section#create(['syntastic', 'whitespace'])
	catch
	endtry
endfunction
auto VimEnter * call AirlineInit()

" Config for sparkup
let g:sparkupDoubleQuote = 1

" Config for tern_for_vim
"let g:tern#command = ["~/.vim/bundle/tern_for_vim/node_modules/tern/bin/tern"]


" ==============================================================================
" ===                            EDITING OPTIONS                             ===
" ==============================================================================

" Line Numbers
set nu

" Hard tabs have width of 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Hightlight long lines
set colorcolumn=80

" Backspace works as it damn well should!
set backspace=indent,eol,start

" Manual line folding
set foldmethod=manual
set foldlevel=1

" Search highlighting
set hlsearch

" Syntax highlighting and colors
sy on
colors molokai

" Windows don't auto-resize when one is closed
set noea

" Custom colorings for various file extensions
auto BufNewFile,BufRead *.bb setlocal filetype=bb
auto BufNewFile,BufRead *.boa setlocal filetype=boa
auto BufNewFile,BufRead *.txt setlocal filetype=txt

" Preserve folds etc. when leaving a file
autocmd BufWrite *[a-zA-Z0-9_.]* mkview
autocmd BufRead *[a-zA-Z0-9_.]* silent loadview

" Enable plugins in editor
filetype plugin on


" ==============================================================================
" ===                            CUSTOM MAPPINGS                             ===
" ==============================================================================

" Increment / decrement one ascii characrer
nmap - :execute "normal! r".nr2char(char2nr(getline('.')[col('.')-1])-1)<CR>:redraw!<CR>
nmap + :execute "normal! r".nr2char(char2nr(getline('.')[col('.')-1])+1)<CR>:redraw!<CR>

" Spellcheck toggle
map <F5> :setlocal spell! spelllang=en_us<cr>

" Clean up bad whitespace
map <F8> :%s/\s\+$//eg<cr>:%s/    /\t/eg<cr>:%s/\r$//eg<cr>

" Custom bindings
map <C-a> :ascii<CR>
map <S-c> `[v`]>gv:s/:\s/:/<cr>:nohlsearch<cr>
map <S-d> diW
map <S-e> :TagbarOpen -fjc<cr>
map <C-f> /\c
map <C-h> :%s///gc<left><left><left><left>
map <S-h> i<cr><esc><up>$
map <S-y> yiW

" Windowing
map <C-t> :sp<CR>:e<Space>
map <S-T> :vsp<CR><TAB>:e<Space>
map <tab> <C-w>w
map <S-tab> <C-w>W
map <C-z> 15<C-e>15<down>
map <C-x> 15<C-y>15<up>
map <S-z> <C-e><down>
map <S-x> <C-y><up>
map <C-S-P> :echo "group='" . synIDattr(synID(line("."),col("."),0),"name") . "'  shown='" . synIDattr(synID(line("."),col("."),1),"name") . "'  links='" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . "'"<CR>
map <esc> :nohlsearch<cr>

" iClumsy
cabbrev W w


" ==============================================================================
" ===                     MANAGING WORDS AND WHITESPACE                      ===
" ==============================================================================

" Navigate Words
map [D b
map [1;5D b
map [C e<right>
map [1;5C e<right>
imap [D <esc>bi
imap [1;5D <esc>bi
imap [C <esc><right>ei<right>
imap [1;5C <esc><right>ei<right>

" Comment multiple lines
vmap <C-c> I//<esc>
vmap <C-b> <del>gv<del>

" Code Folding
map <space> mf%zf'f
nmap f zf
vmap f zf

" Visual tabbing
vmap <tab> >gv
vmap <S-tab> <gv


" ==============================================================================
" ===                      MANAGING GIT CHANGE REGIONS                       ===
" ==============================================================================

nmap [1;5B :GitGutterNextHunk<CR>
nmap [1;5A :GitGutterPrevHunk<CR>
nmap <F6> <Plug>GitGutterStageHunk
nmap <F7> <Plug>GitGutterRevertHunk


" ==============================================================================
" ===                         AUTO-COMPLETE SETTINGS                         ===
" ==============================================================================

" Autocomplete options
set completeopt=longest,menu,preview

" Autocompletion language dictionaries - I haven't gotten these to work...
au FileType python set omnifunc=pythoncomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType c set omnifunc=ccomplete#Complete

" Navigate autocomplete
inoremap <expr> <down> ((pumvisible())?("\<C-n>"):("<down>"))
inoremap <expr> <up> ((pumvisible())?("\<C-p>"):("<up>"))

" Tab Autocomplete
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>


" ==============================================================================
" ===                                  MISC.                                 ===
" ==============================================================================

" Associate .h files with C, always
let g:c_syntax_for_h = 1
let c_syntax_for_h = 1

" After writing to any .vimrc, source that file
au! BufWritePost .vimrc so %

