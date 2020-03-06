"  ____  _             _
" |  _ \| |_   _  __ _(_)_ __  ___
" | |_) | | | | |/ _` | | '_ \/ __|
" |  __/| | |_| | (_| | | | | \__ \
" |_|   |_|\__,_|\__, |_|_| |_|___/
"                |___/

" Manage plugins with https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/bundle')

" Code completion
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Coc extensions are automatically updated each day
" dependencies for coc-python:
"   pip install --user jedi
let g:coc_global_extensions = [
    \'coc-python',
    \'coc-git',
    \'coc-highlight',
    \'coc-tsserver',
    \'coc-eslint',
    \'coc-prettier',
    \'coc-html',
    \'coc-css',
    \'coc-json',
    \]

" Improve syntax and indentation of js files
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" Development Environment
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Beautification
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim'

call plug#end()

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

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-o': 'split',
  \ 'ctrl-v': 'vsplit' }

" Use FZF to grep for a string pattern
command! -bang -nargs=* SilverGrep
  \ call fzf#vim#grep(
  \ 'ag --column --line-number --hidden --ignore .git --no-heading --nocolor --smart-case .'
  \ .shellescape(<q-args>),
  \ 1,
  \ fzf#vim#with_preview({'options': ['--delimiter', ':', '--nth', '4..']}),
  \ <bang>0
  \ )

" Prevent the opening of a completion window when autocompleting
autocmd FileType python setlocal completeopt-=preview

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

autocmd FileType json setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2
"  _  __            ____  _           _ _
" | |/ /___ _   _  | __ )(_)_ __   __| (_)_ __   __ _ ___
" | ' // _ \ | | | |  _ \| | '_ \ / _` | | '_ \ / _` / __|
" | . \  __/ |_| | | |_) | | | | | (_| | | | | | (_| \__ \
" |_|\_\___|\__, | |____/|_|_| |_|\__,_|_|_| |_|\__, |___/
"           |___/                               |___/

" Use Ctrl+F to fuzzy search for files in the current git project (from FZF)
" https://github.com/junegunn/fzf.vim/issues/184#issuecomment-277718034
nnoremap <C-f> :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))<CR>
"<C-_> is actually <C-/> "https://stackoverflow.com/a/9051932
nnoremap <C-_> :SilverGrep<CR>

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

" Highlight color column one after the textwidth
set colorcolumn=+1
hi ColorColumn ctermbg=4

" Use syntax highlighting and color scheme
syntax enable
let g:dracula_colorterm=0
let g:dracula_italic=0
colorscheme dracula

" Highlight trailing whitespaces and tabs
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim settings

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `Ctrl + n` and `Ctrl + p` to navigate diagnostics
nmap <silent> <C-n> <Plug>(coc-diagnostic-next)
nmap <silent> <C-p> <Plug>(coc-diagnostic-prev)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all the lists available
nnoremap <silent> <C-o> :<C-u>CocList lists<cr>
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
