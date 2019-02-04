set nocompatible

inoremap <special> jk <ESC>

" heler fn for loading plugins by variant, but always keeping them installed
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.local/share/nvim/plugged')

"Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-fugitive'

Plug 'rust-lang/rust.vim'

"Plug 'craigemery/vim-autotag'

Plug 'bronson/vim-trailing-whitespace'

"Plug 'majutsushi/tagbar'

Plug 'jremmen/vim-ripgrep'

Plug 'autozimu/LanguageClient-neovim', Cond(has('nvim'), {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ })

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf', Cond(has('nvim'))

Plug 'Shougo/deoplete.nvim', Cond(has('nvim'), { 'do': ':UpdateRemotePlugins' })

call plug#end()

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

if (has("nvim"))
	" ----- language server -----
	"" Required for operations modifying multiple buffers like rename.
	set hidden

	let g:LanguageClient_serverCommands = {
	    \ 'rust': ['rls'],
	    \ }

	" Automatically start language servers.
	let g:LanguageClient_autoStart = 1

	nnoremap <F5> :call LanguageClient_contextMenu()<CR>
	nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
	nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
	nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
endif
