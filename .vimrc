set nocompatible    "be iMproved, required
filetype off        
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

colorscheme desert
"vim plugin install by vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/OmniCppComplete'

call vundle#end()
"wildcart menu
set wildmenu

"line number
set number
"cursorline and cursorcolumn
set cursorline
set cursorcolumn

"ruler
set ruler

"set color column for control code length
set colorcolumn=80

"indent
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab	"tab is replaced with 4 spaces


"allow backspace and direction key to cross line boundary
set whichwrap+=<,>,h,l

"using mouse
set mouse=a

"highlight syntax
syntax enable
syntax on

"encoding
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

set nobackup "no temp file
set noswapfile "no swap file

"auto saving
set autowrite

"""
filetype indent plugin on
set nocp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Keyboard Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F4> :call AddHeader()<CR>
func! AddHeader()
	if &filetype == 'cpp'
		call append(0, "#include <iostream>")
        call append(1, "#include <cstring>")
		call append(2, "#include <algorithm>")
		call append(3, "#include <cstdio>")
		call append(4, "#include <queue>")
		call append(5, "#include <vector>")
		call append(6, "#include <cctype>")
		call append(7, "#include <string>")
        call append(8, "#include <map>")
        call append(9, "")
		call append(10, "using namespace std;")
		call append(11, "")
		call append(12, "int main() {")
		call append(13, "}")
	endif
endfunc

"""""""Python"""""
nmap <F8> :call Python()<CR>
func! Python()
    exec "w"
    exec "!python %"
endfunc

autocmd FileType python set omnifunc=pythoncomplete#Complete

"""""""ACM mode""""""""""
"Compile using g++
nmap <F5> :call Compile()<CR>
func! Compile()
    exec "w"
    if &filetype == "cpp"
        exec "!/usr/local/bin/g++ % -o %< -std=c++11" 
    endif
endfunc

"Run
nmap <F6> :! ./%<<CR>
"Run with file input
nmap <F7> :! ./%< < in.txt<CR>

""""""NERDTree.vim""""""""
map <C-n> :NERDTreeToggle<CR>

"""""Powerline"""""""
set laststatus=2
let g:Powerline_symbols='unicode'
set t_Co=256

nmap <F2> :w !pbcopy<CR>
nmap <F3> :r !pbpaste<CR>

""""""Taglist"""""""
"for ctags in mac is different with ctags in Linux
set tags=tags;
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Show_One_File=1 "only show current file's ctag
let Tlist_Exit_OnlyWindow=1 "exit vim when taglist is the last windows
let Tlist_Use_Right_Window=1 "show taglist windows on the right
let Tlist_GainFocus_On_ToggleOpen=1
nmap <C-l> :TlistToggle<CR>

""""""A.vim""""""""
nmap <C-a> :A<CR>


""""""Syntasitic""""""""
let g:syntastic_error_symbol = '✗'  "set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_cpp_compiler = "/usr/local/g++"
let g:syntastic_cpp_compiler_options = ' -std=c++11'

