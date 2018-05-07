set nocompatible
filetype plugin on
filetype plugin indent on " required
syntax on

set wmnu
set path+=**

set exrc
set secure

" Vim bundle  ---------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree.git'
Plugin 'vimwiki/vimwiki'
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
call vundle#end()
"Plugin 'rafi/awesome-vim-colorschemes'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'vim-scripts/c.vim'

set nu				
set tabstop=4		
set shiftwidth=4	
set nowrap			
set nobackup		
set makeprg=make
set hlsearch

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
set t_ut=
"colors default
"colors elflord

"colorscheme codedark
"highlight Normal ctermbg=None

"https://github.com/dracula/vim/issues/65
let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None

let mapleader = ","
let maplocalleader = "\\"

set listchars=tab:>-,trail:-
set nolist
set clipboard=unnamed
set guifont=Terminus

map <F1> K 
map <F2> <ESC>:w!<CR> 
map <F4>:!gcc -g % && ./a.out < expo.in <CR>
map <F5> <ESC>:NERDTree <CR>
"map <F6> :w<CR>:!g++ % -g && (ulimit -c unlimited; ./a.out < %.in) <CR>
map <F6> :!gedit % <CR>
"map <F6> :!python3 % <CR>
map <F7> <ESC>:bn <CR>
"map <F8> <ESC>:make<CR>
"map <F6> <ESC>:!~/mklist.sh <CR><ESC>:e ~/cprog.list<CR>
nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
"map <F9> <CR> :!~/mkcscope.sh <CR> :cs reset<CR>
"map <F9> :!python3 % <CR>
"map <F12><ESC>:!xsel --clipboard --input < % <CR><CR>
map <F12> <ESC>:e ~/Dropbox/todo/todo.txt <CR>


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




"Plugin 'kien/ctrlp.vim'
map <F10> <ESC>:!xsel --clipboard --input < % <CR><CR>

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md', 'custom_wiki2html': '/home/mjpark/wiki2html.sh' }]

autocmd FileType vimwiki call SetMarkdownOptions()

function! SetMarkdownOptions()
	call VimwikiSet('syntax', 'markdown')
	call VimwikiSet('custom_wiki2html', '/home/mjpark/wiki2html.sh')
endfunction

syntax enable
set background=dark

" BEGIN Vim powerline setting ======================================================
"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
"set laststatus=2
" END Vim powerline setting ======================================================

"UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
