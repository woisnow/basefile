color ron
"color darkblue
set hlsearch
set incsearch
set ic
set smartcase       " Do smart case matching
set autoindent
set number
set expandtab
set tabstop=4
set shiftwidth=4
set showcmd     " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set autowrite       " Automatically save before commands like :next and :make
set fileencodings=ucs-bom,utf8,gbk,latin1
",iso-8859-9,windows-1254
set foldmethod=syntax
"set encoding=gbk

syntax on

"au! BufRead,BufNewFile *.thrift setfiletype thrift
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/syntax/thrift.vim

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

augroup python_prog
au!
fun! Python_fold()
  execute 'syntax clear pythonStatement'
  execute 'syntax keyword pythonStatement break continue del'
  execute 'syntax keyword pythonStatement except exec finally'
  execute 'syntax keyword pythonStatement pass print raise'
  execute 'syntax keyword pythonStatement return try'
  execute 'syntax keyword pythonStatement global assert'
  execute 'syntax keyword pythonStatement lambda yield'
  execute 'syntax match pythonStatement /\<def\>/ nextgroup=pythonFunction skipwhite'
  execute 'syntax match pythonStatement /\<class\>/ nextgroup=pythonFunction skipwhite'
  execute 'syntax region pythonFold start="^\z(\s*\)\%(class\|def\)" end="^\%(\n*\z1\s\)\@!" transparent fold'
  execute 'syntax sync minlines=2000 maxlines=4000'
  set autoindent
  set foldmethod=syntax
  "set foldopen=all foldclose=all
  set foldtext=substitute(getline(v:foldstart),'\\t','\ \ \ \ ','g')
  set fillchars=vert:\|,fold:\
  "set tabstop=4 shiftwidth=4 guioptions+=b
  "set tabstop=4 shiftwidth=4 nowrap guioptions+=b
endfun
autocmd FileType python call Python_fold()
augroup END
set path+=/usr/local/include

set wrap
au BufNewFile,BufRead *.cpp set syntax=cpp11
au BufNewFile,BufRead *.hpp set syntax=cpp11
au BufNewFile,BufRead *.h set syntax=cpp11
let g:netrw_liststyle=3
let g:netrw_keepdir=0

"au FileType python set formatprg=~/pyformat.py
"noremap ` gggqG
