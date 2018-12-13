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

syntax on
syntax enable
set autoindent
set cindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set textwidth=0
set softtabstop=4
set number

set scrolljump=5
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
