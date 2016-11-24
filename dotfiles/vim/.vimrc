" Inspired by https://github.com/alanctkc/dotfiles

" """"""""""""""""""""""""""""""""""""""""""""""""
" =============== General Settings ===============

" vIM
set nocompatible

" Allow per-directory vimrc
set exrc
set secure

" Automatically expand tabs into spaces
set expandtab

" Tabs are four spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Use expected backspace behavior
set backspace=indent,eol,start

" Turn on search highlighting
set hls

" Allow switching between buffers without saving first
set hidden

" Display position coordinates in bottom right
set ruler

" Show line numbers on the left side of the screen
set number

" Get rid of omnicomplete doc preview
"set completeopt=menu

" Use filetype-specific plugins and indentation
set nosmartindent

" Turn off automatic line breaking in html and css
au BufRead,BufNewFile *.html,*.css set textwidth=0

" Use two-space tabs for javascript
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2

" Ignore compiled python
set wildignore+=*.pyc

" Ignore object files
set wildignore+=*.o

" Incrementally search for matches
set incsearch

" Wrap text to next line if over the text limit
set textwidth=79

" Always show the status line
set laststatus=2

" Ignore the case of matches
set ignorecase


" """"""""""""""""""""""""""""""""""""""""""""""""
" =============== Plugin Mangement ===============

" Initialize Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
"Plugin 'scrooloose/nerdtree'
"Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'justinmk/vim-sneak'
Plugin 'suan/vim-instant-markdown'
Plugin 'flazz/vim-colorschemes'
"Plugin 'xero/sourcerer.vim'
"Plugin 'Haron-Prime/evening_vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
" Turn filetype back on
filetype plugin indent on


" """"""""""""""""""""""""""""""""""""""""""""""""
" =============== Plugin Settings ================

"set a global YouCompleteMe config file for syntax checking
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

"turn off confirmation of ycm_extra_conf
let g:ycm_confirm_extra_conf = 0

"let syntastic populate errors messages wthin lists
let g:syntastic_always_populate_loc_list=1

" Use syntastic for flake8
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['pylint']

"let YouCompleteMe use the system installation of python
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

"use python for syntax checking
"let g:syntastic_python_python_exec = 'python'

"let airline plugin use powerline fonts
let g:airline_powerline_fonts = 1

" Ignore case with sneak
let g:sneak#use_ic_scs = 1

" Prevent instant markdown viewer on startup
let g:instant_markdown_autostart = 0

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-o': 'split',
  \ 'ctrl-v': 'vsplit' }


" """"""""""""""""""""""""""""""""""""""""""""""""
" ============= Custom Key Bindings ==============

"""""keymappings for plugins"""""
nnoremap tt :TagbarOpenAutoClose<CR>
"nnoremap <tab><tab> :NERDTreeToggle<CR>
nnoremap <C-f> :GitFiles<CR>

" Move up/down a line visually regardless of the length of the line.
nmap j gj
nmap k gk

" Use Ctrl-z to increment a number (Ctrl-a is taken by Tmux)
map <C-z> <C-a>

" Switch between buffers.
noremap H :bprev<CR>
noremap L :bnext<CR>

" Let Ctrl-c act like Escape for insert mode.
inoremap <C-c> <Esc>

" Remap window movement
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Replace f with sneak
"nmap f <Plug>Sneak_s
"nmap F <Plug>Sneak_S
"xmap f <Plug>Sneak_s
"xmap F <Plug>Sneak_S
"omap f <Plug>Sneak_s
"omap F <Plug>Sneak_S

" """"""""""""""""""""""""""""""""""""""""""""""""
" ==================== Macros ====================

" Python debug macros
let @p = 'Oimport ipdb; ipdb.set_trace()'
let @o = 'Oimport pytest; pytest.set_trace()'

" """"""""""""""""""""""""""""""""""""""""""""""""
" ==================== Colors ====================

" Use 256 colors in color schemes
set t_Co=256
set term=screen-256color

" Highlight color column one after the textwidth
set colorcolumn=+1
hi ColorColumn ctermbg=4

" Use syntax highlighting and color scheme
syntax enable
colorscheme monokain
