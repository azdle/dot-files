" Patrick Barrett's vimrc
" Mostly based on http://vim.wikia.com/wiki/Example_vimrc

" Reset Most Things
set nocompatible

" Esc is hard to reach
imap jk <esc>

" Pretty Colors!
syntax on

" Auto Indentation
filetype indent plugin on
set autoindent

" Line Nums
set number

" File Switching
set hidden

" Better Completion
set wildmenu

" Show partial commands
set showcmd

" Highlight Search
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Display Position
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell
