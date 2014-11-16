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

" Rebind <Leader> key
let mapleader = ","

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <Leader>a <esc>ggVG<CR>
 
" easier moving of code blocks
" " Try to go into visual mode (v), thenselect several lines of code here and
" " then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

 " Quick quit command
noremap <Leader>q :quit<CR>  " Quit current window
noremap <Leader>Q :qa!<CR>   " Quit all windows

"line number
set number
"cursorline and cursorcolumn
set cursorline

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

"Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

"bind Ctrl+<movement> keys to move around the windows, instead of using
"Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"allow backspace and direction key to cross line boundary
set whichwrap+=<,>,h,l

"using mouse
set mouse=a

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>

"highlight syntax
syntax enable
syntax on

"encoding
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

set nobackup    "no temp file
set noswapfile  "no swap file

"auto saving
set autowrite

"""
filetype indent plugin on

"for save and quick easily
:command W w
:command Q q

""hot key for copy and paste use system register
vmap <leader>c "+y
nmap <leader>v "+p

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
map <F11> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.o$','\.so','\.pyc$']

"""""Powerline"""""""
set laststatus=2
let g:Powerline_symbols='unicode'
set t_Co=256

""""""Taglist"""""""
"for ctags in mac is different with ctags in Linux
set tags=tags;
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Show_One_File=1 "only show current file's ctag
let Tlist_Exit_OnlyWindow=1 "exit vim when taglist is the last windows
let Tlist_Use_Right_Window=1 "show taglist windows on the right
let Tlist_GainFocus_On_ToggleOpen=1
nmap <F12> :TlistToggle<CR>

""""""A.vim""""""""
nmap <C-a> :A<CR>


""""""Syntasitic""""""""
let g:syntastic_error_symbol = '✗'  "set error or warning signs
let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_cpp_compiler = "clang++" "use g++ instead of clang
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++' "support c++11
let g:syntastic_cpp_compiler = "/usr/local/bin/g++" "use g++ instead of clang
let g:syntastic_cpp_compiler_options = ' -std=c++11  '"support c++11

""""""OmniCppComplete""""""
set tags+=~/dotfiles/tags/cpp
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"自动关闭补全窗口
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest
" " beautify the complete menu
highlight Pmenu        cterm=none ctermfg=White     ctermbg=DarkGrey
highlight PmenuSel     cterm=none ctermfg=Black     ctermbg=DarkGreen
highlight PmenuSbar    cterm=none ctermfg=none      ctermbg=Green
highlight PmenuThumb   cterm=none ctermfg=DarkGreen ctermbg=DarkGreen
