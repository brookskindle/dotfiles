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

" Use filetype-specific plugins and indentation
set nosmartindent

" Turn off automatic line breaking in html and css
au BufRead,BufNewFile *.html,*.css set textwidth=0
au BufRead,BufNewFile *.html set filetype=htmldjango

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

" Let Vundle manage Vundle, required
" https://github.com/VundleVim/Vundle.vim
Plugin 'VundleVim/Vundle.vim'

" Development Environment
Plugin 'justinmk/vim-sneak'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'suan/vim-instant-markdown'
Plugin 'davidhalter/jedi-vim'
Plugin 'w0rp/ale'
Plugin 'fisadev/vim-isort'

" Beautification
Plugin 'bling/vim-bufferline'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'

call vundle#end()
" Turn filetype back on
filetype plugin indent on


" """"""""""""""""""""""""""""""""""""""""""""""""
" =============== Plugin Settings ================

"let airline plugin use powerline fonts
let g:airline_powerline_fonts = 1

" Ignore case with sneak
let g:sneak#use_ic_scs = 1

" Prevent instant markdown viewer on startup
" The viewer can be invoked via :InstantMarkdownPreview
let g:instant_markdown_autostart = 0

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-o': 'split',
  \ 'ctrl-v': 'vsplit' }

" Prevent Jedi from opening up a completion window when autocompleting
autocmd FileType python setlocal completeopt-=preview

" Only run ALE when files are saved
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0


" """"""""""""""""""""""""""""""""""""""""""""""""
" ============= Custom Key Bindings ==============

"""""keymappings for plugins"""""
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


" """"""""""""""""""""""""""""""""""""""""""""""""
" ==================== Macros ====================

" Quickly add a python debug statement above the current line
let @p = 'Oimport ipdb; ipdb.set_trace()'

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

" Highlight trailing whitespaces and tabs
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/

" Remove tailing whitespaces and tabs on every line
command TrimWhitespace :%s/\s\+$//
