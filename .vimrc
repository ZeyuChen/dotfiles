set nocompatible    "be iMproved, required
filetype off        
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"vim plugin install by vundle
Plugin 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/a.vim'

"wildcart menu
set wildmenu

"line number
set number
"cursorline 
set cursorline
"ruler
set ruler

"indent
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab	"tab is replaced with 4 spaces


"allow backspace and direction key to cross line boundary
set whichwrap+=<,>,h,l

"using mouse
set mouse=a

"hightlight parentheses match
set showmatch

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
        exec "!g++ % -o %<"
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
