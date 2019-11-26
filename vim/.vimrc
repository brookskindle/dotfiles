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

" General productivity
Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'w0rp/ale'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'shumphrey/fugitive-gitlab.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'

" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'moll/vim-node'
Plugin 'ycm-core/YouCompleteMe'

" Beautification
Plugin 'bling/vim-bufferline'
Plugin 'vim-airline/vim-airline'
Plugin 'dracula/vim'
Plugin 'rakr/vim-one'

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

" Show hidden files in NERDTree by default
let NERDTreeShowHidden=1

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-o': 'split',
  \ 'ctrl-v': 'vsplit' }

" Grep for a string pattern - requires RipGrep be installed
" For larger repositories, you should pre-supply a search string through :Rg
" instead.
"
" https://github.com/junegunn/fzf.vim/issues/714#issuecomment-428802659
"
" TODO: This doesn't go up to the root project directory, so if you're in a
" sub-directory less results will be displayed.
command! -bang -nargs=* RipGrepAll call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case ".shellescape(
  \ <q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)



" Prevent ALE from running automatically. It can be manually called via
" :AleLint. See https://github.com/w0rp/ale/issues/288 for more information.
" let g:ale_lint_on_save = 0
" let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0

" https://github.com/standard/standard
let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}

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

" Using ctrl-c in insert mode triggers an omni-complete when in SQL files.
" Disable this.
let g:omni_sql_no_default_maps = 1

" Enhance YCM JavaScript completion with tern's smarts
" https://www.reddit.com/r/node/comments/6jfb68/vim_nodejs_completion/
autocmd FileType javascript setlocal omnifunc=tern#Complete

" Prevent YCM from displaying the preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0

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
autocmd FileType json setlocal shiftwidth=2 softtabstop=2 tabstop=2

autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType eruby setlocal shiftwidth=2 softtabstop=2 tabstop=2

autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2
"  _  __            ____  _           _ _
" | |/ /___ _   _  | __ )(_)_ __   __| (_)_ __   __ _ ___
" | ' // _ \ | | | |  _ \| | '_ \ / _` | | '_ \ / _` / __|
" | . \  __/ |_| | | |_) | | | | | (_| | | | | | (_| \__ \
" |_|\_\___|\__, | |____/|_|_| |_|\__,_|_|_| |_|\__, |___/
"           |___/                               |___/

" Use Ctrl+F to fuzzy search for files in the current git project (from FZF)
nnoremap <C-f> :GitFiles<CR>
" Have a string you want to search for? Use ctrl+/
nnoremap <C-_> :RipGrepAll<CR>

nnoremap tn :NERDTreeToggle<CR>
" View the current file's path in NERDTree
nnoremap <C-p> :NERDTreeFind<CR>

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
let g:dracula_colorterm=0
let g:dracula_italic=0
colorscheme dracula
" colorscheme one
" set background=light

" Highlight trailing whitespaces and tabs
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
