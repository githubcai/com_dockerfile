"vundle"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/usr/share/vim/.vim/bundle/Vundle.vim
call vundle#begin('/usr/share/vim/.vim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"user plugins"
Plugin 'mileszs/ack.vim'
Plugin 'taglist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/LeaderF'
Plugin 'preservim/tagbar'
Plugin 'tpope/vim-sleuth'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"设置字体"
syntax on   "开启语法高亮"
set term=xterm-color
colorscheme darkblue
filetype on
set mouse=a
set nu
set cindent
set shiftwidth=4
set tabstop=4
set noexpandtab
set autoindent
set encoding=utf-8
set backspace=indent,eol,start
set hlsearch 
set ru

"ack
if executable('rg')
    let g:ackprg = 'rg --vimgrep --ignore-file /usr/share/vim/.rgignore'
endif

"rg search
nnoremap <F1> <Esc>:Ack! -w <C-R><C-W><CR><CR>
nnoremap <F2> <Esc>:cp<CR>
nnoremap <F3> <Esc>:cn<CR>
nnoremap <F4> <Esc>:ccl<CR>

set tags+=./tags;,tags
let g:jedi#completions_command = "<C-N>" 
let g:ycm_global_ycm_extra_conf = "/usr/share/vim/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"
let g:ycm_semantic_triggers =  {
  \   'c': ['->', '.'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::'],
  \   'perl': ['->'],
  \   'php': ['->', '::'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }

if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
   	set cst
	set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
    	cs add cscope.out
   	" else add database pointed to by environment
    elseif $CSCOPE_DB != ""
       	cs add $CSCOPE_DB
   	endif
  	set csverb
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>:cw<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>:cw<CR>

"LeaderF support git submodule
let g:Lf_UseVersionControlTool = 0
let g:Lf_DefaultExternalTool = "rg"

"open vim-sleuth auto detection
let g:sleuth_automatic = 1
