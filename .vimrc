set nu				
set tabstop=4		
set shiftwidth=4	
set nowrap			
set nobackup		
set makeprg=make
set hlsearch
colors koehler

set listchars=tab:>-,trail:-
set nolist
set clipboard=unnamed
set guifont=Terminus

map <F1> K 
map <F2> <ESC>:w!<CR> 
map <F4> : !gcc -g % && ./a.out < expo.in <CR>
map <F6> :w<CR>:!g++ % -g && (ulimit -c unlimited; ./a.out < %.in) <CR>
map <F7> : !python ~/submit.py % <CR>
map <F8> <ESC>:make<CR>

nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
map <F9> <CR> :!~/mkcscope.sh <CR> :cs reset<CR>

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

