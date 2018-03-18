:"----------------------------------------------------------------
" Maintainer: 
"       rsanchezavalos
"----------------------------------------------------------------
"----------------------------------------------------------------
"  <> Plugins
"----------------------------------------------------------------
"
" vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"git interface
Plugin 'tpope/vim-fugitive'
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' 
"html
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
"auto-completion stuff
Plugin 'ervandew/supertab'
""code folding
Plugin 'tmhedberg/SimpylFold'
"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'jnurmine/Zenburn'

" pep8 indent
Plugin 'Vimjas/vim-python-pep8-indent'


call vundle#end()
filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1
call togglebg#map("<F5>")
"colorscheme zenburn
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


"----------------------------------------------------------------
"  <> General
"----------------------------------------------------------------
" Set line numbers
set nu 

" Highlight max line lenght - 79 pep-8 (python)
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 79)

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Fast saving - force
nmap <leader>w :w!<cr>

"----------------------------------------------------------------
"  <> VIM user interface
"----------------------------------------------------------------
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
"set wildmenu

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
" set ignorecase

" When searching try to be smart about cases 
" set smartcase

" Highlight search results
set hlsearch

" Incremental Search as you add characters
set incsearch 

" Don't redraw while executing macros (good performance config)
" set lazyredraw 

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8


"----------------------------------------------------------------
"  <> Files, backups and undo
"----------------------------------------------------------------
" Turn backup off
set nobackup
set nowb
set noswapfile


"----------------------------------------------------------------
"  <> Text, tab and indent related
"----------------------------------------------------------------
" Use spaces instead of tabs
set expandtab
" Define the number of spaces -> 1 tab == 4 spaces 
set shiftwidth=4
set tabstop=4

" Smart tab and indent
set smarttab
:set smartindent
:set autoindent

" Linebreak on 500 characters
set lbr
set tw=500
set wrap "Wrap lines


"----------------------------------------------------------------
"  <> Visual mode related
"----------------------------------------------------------------
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"----------------------------------------------------------------
" Always show the status line
set laststatus=2


"----------------------------------------------------------------
"  <> Python PEP-8 
"----------------------------------------------------------------

" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
set foldlevel=99

"use space to open folds
nnoremap <space> za 
