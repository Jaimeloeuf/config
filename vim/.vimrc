source $VIMRUNTIME/vimrc_example.vim

" Make VIM incompatible with VI
set nocompatible

" Append plugin manager in

filetype on
filetype plugin on
filetype indent on

" autocomplete parenthesis, brackets and braces
  inoremap ( ()<Left>
  inoremap [ []<Left>
  inoremap { {}<Left>
  
  " autocomplete quotes
  inoremap      '  '<Esc>:call QuoteInsertionWrapper("'")<CR>a
  inoremap      "  "<Esc>:call QuoteInsertionWrapper('"')<CR>a
  inoremap      `  `<Esc>:call QuoteInsertionWrapper('`')<CR>a
  
  function! QuoteInsertionWrapper (quote)
    let col = col('.')
    if getline('.')[col-2] !~ '\k' && getline('.')[col] !~ '\k'
      normal ax
      exe "normal r".a:quote."h"
    end
  endfunction

" Show numbers
set number

" Enable syntax highlighting
syntax enable

" Turn on syntax?
syntax on

set autoindent
set cindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4

" 
set shiftwidth=4
set textwidth=0

" Set the maximum number of tabs that can be displayed. Default: 10
set tabpagemax=15



set scrolljump=5

" Move screen when cursor less than 3 lines to top or bottom of the screen
set scrolloff=3

set ruler
set showmatch
set history=0
set nobackup
set visualbell
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.fasl
set showcmd

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction