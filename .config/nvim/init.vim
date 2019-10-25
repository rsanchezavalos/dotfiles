" vim: fdm=marker
"
" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
"
"  ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
" ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
" ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
" ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
" ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
"  ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝
"
" Author: Roberto S.
" Based on - Ollincito config
" ============================================================================
syntax on

" ============================================================================
" Neovim default {{{1
" ============================================================================

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
    set nocompatible               " Be iMproved
endif

" This one is to avoid cursor problems on a ssh connection
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0

" ============================================================================
" Plugins (administrated by plugged) {{{1
" ============================================================================

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'  " file list
Plug 'majutsushi/tagbar'  " show tags in a bar (functions etc) for easy browsing
Plug 'vim-airline/vim-airline'  " make statusline awesome
Plug 'vim-airline/vim-airline-themes'  " themes for statusline
Plug 'jonathanfilip/vim-lucius'  " nice white colortheme
Plug 'davidhalter/jedi-vim'   " jedi for python
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
Plug 'Vimjas/vim-python-pep8-indent'  "better indenting for python
Plug 'kien/ctrlp.vim'  " fuzzy search files
Plug 'tweekmonster/impsort.vim'  " color and sort imports
Plug 'wsdjeg/FlyGrep.vim'  " awesome grep on the fly
Plug 'w0rp/ale'  " python linters
Plug 'airblade/vim-gitgutter'  " show git changes to files in gutter
Plug 'tpope/vim-commentary'  "comment-out by gc
Plug 'roxma/nvim-yarp'  " dependency of ncm2
Plug 'ncm2/ncm2'  " awesome autocomplete plugin
Plug 'HansPinckaers/ncm2-jedi'  " fast python completion (use ncm2 if you want type info or snippet support)
Plug 'ncm2/ncm2-bufword'  " buffer keyword completion
Plug 'ncm2/ncm2-path'  " filepath completion

" Terminal or IDE
Plug 'kassio/neoterm'
" UI Layout
Plug 'nightsense/vim-crunchbang'
Plug 'dracula/vim'
Plug 'jdsimcoe/abstract.vim'
Plug 'ryanoasis/vim-devicons'

" CSV
Plug 'chrisbra/csv.vim'

" Powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Writting
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/vim-shebang'
Plug 'bitc/vim-bad-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'JamshedVesuna/vim-markdown-preview'

" Syntax
Plug 'vim-latex/vim-latex'
Plug 'ivanov/vim-ipython'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'ajpaulson/julia-syntax.vim'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'myusuf3/numbers.vim'

" Folding
Plug 'tmhedberg/SimpylFold'

" Organizing
Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim'

" Cooperation
Plug 'tpope/vim-fugitive'
Plug 'FredKSchott/CoVim'

" Organize
Plug 'jceb/vim-orgmode'
Plug 'vimwiki/vimwiki'

" Data
Plug 'szymonmaszke/vimpyter'
" deoplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()

" path to your python
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

filetype indent on

" ============================================================================
" Basic settings and maps {{{1
" ============================================================================

" Time in milliseconds that is waited for a key code or mapped key sequence to
" complete.
set ttimeoutlen=50
set fileformat=unix
set shortmess+=c

set mouse=a  " change cursor per mode
set number  " always show current line number
set smartcase  " better case-sensitivity when searching
set wrapscan  " begin search from top of file when nothing is found anymore

" Set basic defaults
syntax on
hi Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=none
set autoread
set number
let g:rainbow_active = 1
set expandtab
set shiftwidth=4
set softtabstop=4

set history=1000  " remember more commands and search history
set nobackup  " no backup or swap file, live dangerously
set noswapfile  " swap files give annoying warning

set breakindent  " preserve horizontal whitespace when wrapping
set showbreak=..
set lbr  " wrap words
set nowrap  " i turn on wrap manually when needed

set scrolloff=3 " keep three lines between the cursor and the edge of the screen

set undodir=~/.vim/undodir
set undofile  " save undos
set undolevels=10000  " maximum number of changes that can be undone
set undoreload=100000  " maximum number lines to save for undo on a buffer reload

set noshowmode  " keep command line clean
set noshowcmd

set laststatus=2  " always slow statusline

set splitright  " i prefer splitting right and below
set splitbelow

set hlsearch  " highlight search and search while typing
set incsearch
set cpoptions+=x  " stay at seach item when <esc>

set noerrorbells  " remove bells (i think this is default in neovim)
set visualbell
set t_vb=
set relativenumber
set viminfo='20,<1000  " allow copying of more than 50 lines to other applications

" easy split movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" tabs:
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" ============================================================================
" UI Layout {{{1
" ============================================================================

let t_Co = 256
if (has("termguicolors"))
    set termguicolors
endif
set background=dark
set encoding=utf8
set guifont=IBM\ Plex\ Mono:h14
" set guifont=Noto\ Mono\ for\ Powerline:h14
colorscheme crunchbang


" ============================================================================
" NERDTree {{{1
" ============================================================================
"silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
vnoremap <buffer> <silent> <C-p> :NERDTreeToggle<CR>j

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"


" ============================================================================
" Folding {{{1
" ============================================================================
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za


" mapping Esc
imap <F13> <Esc>
cnoremap <Esc> <C-c>
inoremap <c-c> <ESC>
nnoremap <C-z> <Esc>  " disable terminal ctrl-z

" map S to replace current word with pasteboard
nnoremap S diw"0P
nnoremap cc "_cc
nnoremap q: :q<CR>
nnoremap w: :w<CR>

set clipboard=unnamedplus

" ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
" make it FAST
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'

set pumheight=5
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> (pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : "\<CR>"

let g:airline_powerline_fonts = 1
let g:airline_section_y = ""
let g:airline#extensions#tabline#enabled = 1

" Airline settings
" do not show error/warning section
let g:airline_section_error = ""
let g:airline_section_warning = ""

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" theicfire .vimrc tips
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " " " Leader is the space key
let g:mapleader = " "
let maplocalleader = "`"
let g:maplocalleader = "`"
nnoremap <SPACE> <Nop>

"auto indent for brackets
nmap <leader>w :w!<cr>
nmap <leader>q :lcl<cr>:q<cr>
nnoremap <leader>h :nohlsearch<Bar>:echo<CR>

" FlyGrep settings
nnoremap <leader>s :FlyGrep<cr>

" easy breakpoint python
au FileType python map <silent> <leader>b ofrom pudb import set_trace; set_trace()<esc>
au FileType python map <silent> <leader>B Ofrom pudb import set_trace; set_trace()<esc>
au FileType python map <silent> <leader>j ofrom pdb import set_trace; set_trace()<esc>
au FileType python map <silent> <leader>J Ofrom pdb import set_trace; set_trace()<esc>

" ale options
let g:ale_python_flake8_options = '--ignore=E129,E501,E302,E265,E241,E305,E402,W503'
let g:ale_python_pylint_options = '-j 0 --max-line-length=120'
let g:ale_list_window_size = 4
let g:ale_sign_column_always = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = '1'

" Options are in .pylintrc!
highlight VertSplit ctermbg=253

let g:ale_sign_error = '‼'
let g:ale_sign_warning = '∙'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = '0'
let g:ale_lint_on_save = '1'
nmap <silent> <C-M> <Plug>(ale_previous_wrap)
nmap <silent> <C-m> <Plug>(ale_next_wrap)

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction

onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")

" highlight python and self function
autocmd BufEnter * syntax match Type /\v\.[a-zA-Z0-9_]+\ze(\[|\s|$|,|\]|\)|\.|:)/hs=s+1
autocmd BufEnter * syntax match pythonFunction /\v[[:alnum:]_]+\ze(\s?\()/
hi def link pythonFunction Function
autocmd BufEnter * syn match Self "\(\W\|^\)\@<=self\(\.\)\@="
highlight self ctermfg=239

" jedi options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = 'i'  " ni = also in normal mode
let g:jedi#enable_speed_debugging=0

" Impsort option
hi pythonImportedObject ctermfg=127
hi pythonImportedFuncDef ctermfg=127
hi pythonImportedClassDef ctermfg=127

" Remove all trailing whitespace by pressing C-S
nnoremap <C-S> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

""" move between defs python:
""# NOTE: this break shortcuts with []
""nnoremap [[ [m
""nnoremap ]] ]m

nnoremap <silent><nowait> [ [[
nnoremap <silent><nowait> ] ]]

function! MakeBracketMaps()
    nnoremap <silent><nowait><buffer> [ :<c-u>exe 'normal '.v:count.'[m'<cr>
    nnoremap <silent><nowait><buffer> ] :<c-u>exe 'normal '.v:count.']m'<cr>
endfunction

augroup bracketmaps
    autocmd!
    autocmd FileType python call MakeBracketMaps()
augroup END

" neovim options
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
nnoremap <C-a> <Esc>
nnoremap <C-x> <Esc>

" vimgutter options
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_map_keys = 0

" ctrl p options
let g:ctrlp_custom_ignore = '\v\.(npy|jpg|pyc|so|dll)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" Surround {{{1
" ============================================================================
" Easier surrounding
map ss ysiw

" ============================================================================
" Autocommands {{{1
" ============================================================================

au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix

au BufNewFile,BufRead *.jl
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix

au BufNewFile,BufRead *.sh
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix |
            \ :ShebangInsert bash

au BufNewFile,BufRead *.R
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix

" ============================================================================
" Terminal {{{1
" ============================================================================

" Where should the terminal open
let g:neoterm_default_mod = 'vertical:'
let g:neoterm_keep_term_open = 1
"let g:neoterm_size=36 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command

" Neoterm mappings
silent! nmap <C-l> :TREPLSendLine<CR>
"silent! nmap <leader><C-s> :TREPLSendSelection<CR>j
vnoremap <buffer> <silent> <C-j> :TREPLSendSelection<CR>j

" Commands to deal with the terminal
"nnoremap <silent> <leader>to :Topen<CR>
"nnoremap <silent> <leader>tc :Tclose<CR>
"nnoremap <silent> <leader>tt :Ttoggle<CR>
"nnoremap <silent> <leader>tk :Tkill<CR>
"nnoremap <silent> <leader>tl :Tclear<CR>
"nnoremap <silent> <leader>ts :T %:p<CR>
"nnoremap <silent> <leader>tp :T python %:p<CR>
"vnoremap <silent> <leader>tj :T julia<CR>

" Easily change from insert to normal mode on a terminal
tnoremap <Esc> <C-\><C-n>


" ============================================================================
" Fugitive (GIT) {{{1
" ============================================================================

" Git commands
command! -nargs=+ Tg :T git <args>

" ============================================================================
" LaTeX {{{1
" ============================================================================

let g:tex_flavor = "pdflatex"
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode $*'

" ============================================================================
" NERDcommenter {{{1
" ============================================================================

" Add a space between comment delimiter and comment
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" ============================================================================
" Shebang {{{1
" ============================================================================

" Define my common Shebang
let g:shebang#shebangs = {
            \ 'julia': '#!/usr/bin/env julia',
            \ 'sh': '#!/usr/bin/env bash',
            \ 'python': '#!/usr/bin/env python',
            \ 'R': '#!/usr/bin/env Rscript'
            \}

" ============================================================================
" Folding {{{1
" ============================================================================

let g:SimpylFold_docstring_preview=1

" ============================================================================
" Buffers {{{1
" ============================================================================

command! -nargs=+ Bs :vert sbuffer <args>

" Commands to deal with the buffers without going all the way through the
" colon
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>ls :ls<CR>
nnoremap <silent> <leader>bs1 :Bs 1<CR>
nnoremap <silent> <leader>bs2 :Bs 2<CR>
nnoremap <silent> <leader>bs3 :Bs 3<CR>
nnoremap <silent> <leader>bs4 :Bs 4<CR>
nnoremap <silent> <leader>bs5 :Bs 5<CR>


" ============================================================================
" Calendar {{{1
" ============================================================================

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" ============================================================================
" CSV {{{1
" ============================================================================

let b:csv_arrange_align = 'l*'

" ============================================================================
" Numbers {{{1
" ============================================================================

nnoremap <silent> <leader>nt :NumbersToggle<CR>
nnoremap <silent> <leader>no :NumbersOnOff<CR>

" ============================================================================
" Markdown {{{1
" ============================================================================

let vim_markdown_preview_hotkey='<C-m>'
" let vim_markdown_preview_browser='firefox'
let vim_markdown_preview_pandoc=1

" ============================================================================
" Jupyter Notebooks {{{1
" ============================================================================

autocmd Filetype ipynb nmap <silent><Leader>bb :VimpyterInsertPythonBlock<CR>
autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>
let g:vimpyter_color = 1
