set nocompatible    "be iMproved, required
filetype off        

"Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
"Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
"Plugin 'python-mode/python-mode'
Plugin 'vim-airline/vim-airline'
"Plugin 'Valloric/YouCompleteMe'

" C++ 自动补全
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'
" ...
call vundle#end()
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]

" Rebind <Leader> key
let mapleader = ","

"Color schema
colorscheme desert

" easier moving of code blocks
" " Try to go into visual mode (v), thenselect several lines of code here and
" " then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

 " Quick quit command
noremap <leader>q :quit<CR>  " Quit current window
noremap <leader>Q :qa!<CR>   " Quit all windows
map <leader>a <esc>ggVG<CR>

"hot key for copy and paste use system register
vmap <leader>c "+y
nmap <leader>v "+p

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
set cindent
set cinoptions+=g0
set shiftwidth=2
set softtabstop=2
set tw=80
set tabstop=2   "tab is replaced with 4 spaces
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
set mouse=

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>

"highlight syntax
syntax enable
syntax on

"encoding
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,latin1

set nobackup    "no temp file
set noswapfile  "no swap file

"auto saving
set autowrite

"""
filetype indent plugin on

"for save and quick easily
:command W w
:command Q q

""""""NERDTree.vim""""""""
map <leader>[ :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.o$','\.so','\.pyc$']

"""""Powerline"""""""
"let g:Powerline_symbols = 'fancy'
set laststatus=2

""""""Taglist"""""""
"for ctags in mac is different with ctags in Linux
set tags=tags;
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1 "only show current file's ctag
let Tlist_Exit_OnlyWindow=1 "exit vim when taglist is the last windows
let Tlist_Use_Right_Window=1 "show taglist windows on the right
let Tlist_GainFocus_On_ToggleOpen=1
nmap <leader>] :TlistToggle<CR>

""""""A.vim""""""""
nmap <leader>s :A<CR>


""""""Syntasitic""""""""
"let g:syntastic_error_symbol = '✗'  "set error or warning signs
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_cpp_compiler = "/opt/compiler/gcc-4.8.2/bin/g++" "use g++ instead of clang
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++' "support c++11
"let g:syntastic_cpp_compiler = "/usr/local/bin/g++" "use g++ instead of clang
"let g:syntastic_cpp_compiler_options = ' -std=c++0x  ' "support c++11

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

""""""Python-Mode"""""""""""
" let g:pymode_python = "python3"
" let g:pymode_run = 1
" let g:pymode_run_bind = '<leader>r'
" "let g:pymode_breakpoint = 1
" "let g:pymode_breakpoint_bind = '<leader>b'
" "let g:pymode_breakpoint_cmd = ''
" let g:pymode_lint_checkers = 'pylint' 
" let g:pymode_warnings = 1
" let g:pymode_options = 1
" let g:pymode_options_max_line_length = 79
" let g:pymode_indent = 1
" let g:pymode_virtualenv_path="/anaconda3"
" "let g:pymode_paths=['/usr/local/bin/']
" let g:pymode_paths=[]


""""""""vim-codefmt""""""""""""""""""""'
" 自动代码格式化
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " autocmd FileType python AutoFormatBuffer autopep8
augroup END

""""""""jedi-vim""""""""""""
let g:jedi#auto_initialization = 0
let g:SuperTabDefaultCompletionType = "context"
let g:jedi#popup_on_dot = 0


""""""auto set title"""""""""""""""""""'

" add header comments for .h .c .hpp .cpp .mk .sh new file
" auto call SetTitle func
autocmd BufNewFile *.[ch],*.hpp,*.cpp,Makefile,*.mk,*.sh,*.py exec ":call SetTitle()"
 
" add comment for cpp
func SetLicencePy()
	call append(0,  "#   Copyright (c) ".strftime("%Y")."  PaddlePaddle Authors. All Rights Reserved.")
	call append(1,  "#   ")
	call append(2,  "# Licensed under the Apache License, Version 2.0 (the \"License\"")";
	call append(3,  "# you may not use this file except in compliance with the License.")
	call append(4,  "# You may obtain a copy of the License at")
	call append(5,  "#   ")
	call append(6,  "#     http://www.apache.org/licenses/LICENSE-2.0")
	call append(7,  "#   ")
	call append(8,  "# Unless required by applicable law or agreed to in writing, software")
	call append(9, "# distributed under the License is distributed on an \"AS IS\" BASIS,")
	call append(10, "# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.")
	call append(11, "# See the License for the specific language governing permissions and")
	call append(12, "# limitations under the License.")
	call append(13, "")
endfunc

func SetHeader()
	if &filetype == 'python'
		call SetLicencePy()
	endif
endfunc

map <leader>l :call SetHeader() <CR>


""""""""auto run scripts"""""""""""""
map <leader>r :call RunScripts() <CR>
func RunScripts()
  exec "w"
  if &filetype == 'sh'
    exec :!bash %
  elseif &filetype == 'python'
    exec "!python %"
  endif
endfunc
