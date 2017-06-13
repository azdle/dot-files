set nocompatible

filetype off

inoremap <special> jk <ESC>

" For vundle
set shell=/bin/bash

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'vim-syntastic/syntastic'

Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

Plugin 'rust-lang/rust.vim'

Plugin 'craigemery/vim-autotag'

Plugin 'bronson/vim-trailing-whitespace'

Plugin 'majutsushi/tagbar'

if (has("nvim"))
	Plugin 'autozimu/LanguageClient-neovim'

	" (Optional) Multi-entry selection UI.
	Plugin 'junegunn/fzf'
	" (Optional) Multi-entry selection UI.
	Plugin 'Shougo/denite.nvim'

	" (Optional) Completion integration with deoplete.
	Plugin 'Shougo/deoplete.nvim'
	" (Optional) Completion integration with nvim-completion-manager.
	Plugin 'roxma/nvim-completion-manager'

	" (Optional) Showing function signature and inline doc.
	Plugin 'Shougo/echodoc.vim'
endif

call vundle#end()

filetype plugin indent on

set clipboard=unnamed "use system clipboard
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on

set cursorline

set mouse=a

" <C-\> opens tag in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" for sytastic
hi clear SignColumn

" ----- jistr/vim-nerdtree-tabs -----
" open/close nerdtree tabs with \t
nmap <silent> <leader>f :NERDTreeTabsToggle<CR>
" open on startup
"let g:nerdtree_tabs_open_on_console_startup = 1

" ----- syntastic -----
let g:syntastic_error_symbol = "✘"
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
	au!
	au FileType tex let b:syntastic_mode = "passive"
augroup END

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']

let g:syntastic_c_checkers = ['clangcheck', 'clanglint']

" ----- tagbar -----
nmap <silent> <leader>t :TagbarToggle<CR>


if (has("nvim"))
	" ----- language server -----
	"" Required for operations modifying multiple buffers like rename.
	set hidden

	let g:LanguageClient_serverCommands = {
	    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
	    \ }

	" Automatically start language servers.
	let g:LanguageClient_autoStart = 1

	nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
	nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
	nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
endif
