" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	  "autocmd VimEnter * PlugInstall
	  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

	" Begin Syntax Support
	Plug 'sheerun/vim-polyglot'
	" File Explorer
	Plug 'scrooloose/NERDTree'
	" Auto pairs for '(' '[' '{'
	Plug 'jiangmiao/auto-pairs'

	" Git plugins
	Plug 'mhinz/vim-signify'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
	Plug 'junegunn/gv.vim'

	" Which key
	Plug 'liuchengxu/vim-which-key'

	" Floaterm (floating terminals)
	Plug 'voldikss/vim-floaterm'

	call plug#end()

" =====================================

" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" =====================================
" " Initial settings
" " =====================================

" Line numbering
" Toggle set to ';n' in key map section
set nonumber

" file type recognition
filetype on
filetype plugin on
filetype indent on

" syntax highlighting
syntax on

" open new split panes to right and below (as you probably expect)
set splitright
set splitbelow

" Press nn to return to normal mode when in insert mode
inoremap ii <ESC>
inoremap <ESC> <NOP>

" Press ii to return to normal mode when in visual mode
vnoremap ii <ESC>
vnoremap <ESC> <NOP>

" Press ii when in Command mode, to go back to normal mode
cnoremap ii <ESC>
