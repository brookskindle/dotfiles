"  ____  _             _
" |  _ \| |_   _  __ _(_)_ __  ___
" | |_) | | | | |/ _` | | '_ \/ __|
" |  __/| | |_| | (_| | | | | \__ \
" |_|   |_|\__,_|\__, |_|_| |_|___/
"                |___/

" Initialize Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
" https://github.com/VundleVim/Vundle.vim
Plugin 'VundleVim/Vundle.vim'

" Development Environment
Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'suan/vim-instant-markdown'
Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'
Plugin 'fisadev/vim-isort'
Plugin 'rodjek/vim-puppet'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" Beautification
Plugin 'bling/vim-bufferline'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'

call vundle#end()
" Turn filetype back on
filetype plugin indent on

"  ____  _             _          ____             __ _
" |  _ \| |_   _  __ _(_)_ __    / ___|___  _ __  / _(_) __ _
" | |_) | | | | |/ _` | | '_ \  | |   / _ \| '_ \| |_| |/ _` |
" |  __/| | |_| | (_| | | | | | | |__| (_) | | | |  _| | (_| |
" |_|   |_|\__,_|\__, |_|_| |_|  \____\___/|_| |_|_| |_|\__, |
"                |___/                                  |___/

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

" Prevent the opening of a completion window when autocompleting
autocmd FileType python setlocal completeopt-=preview

" Prevent ALE from running automatically. It can be manually called via
" :AleLint. See https://github.com/w0rp/ale/issues/288 for more information.
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0

" Integrate Limelite with Goyo
let g:limelight_conceal_ctermfg = 'gray'

" Hide tmux statusbar when entering goyo
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

" Restore tmux statusbar when leaving goyo
function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"   ____ _       _           _   ____       _   _   _
"  / ___| | ___ | |__   __ _| | / ___|  ___| |_| |_(_)_ __   __ _ ___
" | |  _| |/ _ \| '_ \ / _` | | \___ \ / _ \ __| __| | '_ \ / _` / __|
" | |_| | | (_) | |_) | (_| | |  ___) |  __/ |_| |_| | | | | (_| \__ \
"  \____|_|\___/|_.__/ \__,_|_| |____/ \___|\__|\__|_|_| |_|\__, |___/
"                                                           |___/

" vIM
set nocompatible

" Allow per-directory vimrc
set exrc
set secure

" Unless otherwise specified, expand tabs to spaces and use four space tabs
set expandtab
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
" Unless you explicitly use an uppercase character
set smartcase

"  _
" | |    __ _ _ __   __ _ _   _  __ _  __ _  ___  ___
" | |   / _` | '_ \ / _` | | | |/ _` |/ _` |/ _ \/ __|
" | |__| (_| | | | | (_| | |_| | (_| | (_| |  __/\__ \
" |_____\__,_|_| |_|\__, |\__,_|\__,_|\__, |\___||___/
"                   |___/             |___/

au BufRead,BufNewFile *.html setlocal filetype=htmldjango

autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4

autocmd FileType htmldjango setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2

autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType eruby setlocal shiftwidth=2 softtabstop=2 tabstop=2

autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType puppet setlocal shiftwidth=2 softtabstop=2 tabstop=2

"  _  __            ____  _           _ _
" | |/ /___ _   _  | __ )(_)_ __   __| (_)_ __   __ _ ___
" | ' // _ \ | | | |  _ \| | '_ \ / _` | | '_ \ / _` / __|
" | . \  __/ |_| | | |_) | | | | | (_| | | | | | (_| \__ \
" |_|\_\___|\__, | |____/|_|_| |_|\__,_|_|_| |_|\__, |___/
"           |___/                               |___/

" Use Ctrl+F to fuzzy search for files in the current git project (from FZF)
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

" Quickly add a python debug statement above the current line by pressing @p
" while in normal mode
let @p = 'Oimport ipdb; ipdb.set_trace()'

" Remove tailing whitespaces and tabs on every line
command TrimWhitespace :%s/\s\+$//

"   ____      _
"  / ___|___ | | ___  _ __ ___
" | |   / _ \| |/ _ \| '__/ __|
" | |__| (_) | | (_) | |  \__ \
"  \____\___/|_|\___/|_|  |___/
"

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
