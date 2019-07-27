set nocompatible
filetype plugin on
filetype plugin indent on " required
syntax on

"autocmd BufNewFile,BufRead,FileType,OptionSet * set formatoptions-=cro
"autocmd BufNewFile,BufRead,FileType,OptionSet * setlocal formatoptions-=cro
au BufNewFile,BufRead todo.txt set filetype=todo
au BufNewFile,BufRead done.txt set filetype=todo

set guifont=Inconsolata:h13

set wmnu
set path+=**

set exrc
set secure

" Vim bundle  ---------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/taglist.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tomasiser/vim-code-dark'
Plugin 'sickill/vim-monokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'dracula/vim'
Plugin 'mileszs/ack.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'jnurmine/Zenburn'
Plugin 'vim-scripts/c.vim'
Plugin 'freitass/todo.txt-vim'
Plugin 'tomasr/molokai'
Plugin 'easymotion/vim-easymotion'
Plugin 'bogado/file-line'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'vim-scripts/Blueshift'
Plugin 'mattn/emmet-vim'

call vundle#end()
"Plugin 'gu-fan/riv.vim'
"Plugin 'gu-fan/InstantRst'
"Plugin 'gu-fan/rhythm.css'

set nu				
set smartindent
set expandtab
set tabstop=4		
set shiftwidth=4	
set nowrap			
set nobackup
set nowritebackup
set makeprg=make
set hlsearch

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
set t_ut=
"
"set background=dark
"set background=white
"colorscheme molokai
"let g:dracula_italic = 0
"colorscheme dracula

"highlight Normal ctermbg=None
colorscheme codedark
"colorscheme molokai


let mapleader = ","
let maplocalleader = "\\"

set listchars=tab:>-,trail:-
set nolist
set clipboard=unnamed
set guifont=Terminus

map <F1> K 
map <F2> <ESC>:w!<CR> 
map ,rr <ESC>:!node % <CR>
map ,bb <ESC>:!g++ -o a.out % <CR>
map ,ss <ESC>:sh <CR>
"map <F12> <ESC>:e ~/Dropbox/todo/todo.txt <CR>
map <F5> <ESC>:NERDTreeToggle <CR>
map <F6> <ESC>:TlistToggle <CR>
map <F7> <ESC>:bn <CR>
nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
"map <F9> <CR> :!~/mkcscope.sh <CR> :cs reset<CR>
map <F9> :!python3 % <CR>
map <F10> <ESC>:!xsel --clipboard --input < % <CR><CR>
map <F12> <ESC>:e ~/Dropbox/todo/todo.txt <CR>


"---------------------------------------------------------------
" cscope setting
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

if filereadable("./cscope.out")
	cs add cscope.out
else 
	cs add /usr/src/linux/cscope.out

endif
set csverb

map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

" Hitting CTRL-space *twice* before the search type does a vertical
" split instead of a horizontal one

nmap <C-@><C-@>s
	\:vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g
	\:vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c
	\:vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t
	\:vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e
	\:vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>i
	\:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@><C-@>d
	\:vert scs find d <C-R>=expand("<cword>")<CR><CR>





syntax enable

" BEGIN Vim powerline setting ======================================================
"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
"set laststatus=2
" END Vim powerline setting ======================================================

"---------------------------------------------------------------
"UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

xnoremap <LEADER>c <ESC>:'<,'>:w !python3<CR>

"---------------------------------------------------------------
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"map <C-]> :YcmCompleter GoToImprecise<CR>
set tags+=./.tags
"---------------------------------------------------------------


"---------------------------------------------------------------
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
let g:syntastic_c_compiler_options = "-std=c11 -Wall -Wextra"

let g:syntastic_c_check_header = 1
let g:syntastic_c_clang_check_post_args = ""
let g:syntastic_clang_check_config_file = "./compile_commands.json"
"---------------------------------------------------------------
"colorscheme	morning

"---------------------------------------------------------------
"NERDTree 
let g:NERDTreeWinPos = "right"
"---------------------------------------------------------------
