set t_Co=256 "Enable 256 colors
set nocompatible              " be iMproved, required
set backspace=indent,eol,start
call plug#begin('~/.vim/plugged')
" Neovim specific plugins
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }
  Plug 'w0rp/ale'
  let g:ale_linters = {
  \ 'python': ['flake8'],
  \}
  "Plug 'zchee/deoplete-clang'
  "Plug 'zchee/deoplete-go'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
endif

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
"Plug 'flazz/vim-colorschemes'
"Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sleuth'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'yggdroot/indentline'
Plug 'edkolev/tmuxline.vim'

set completeopt-=preview " Disable deoplete preview

call plug#end()            " required

if has('nvim')
  let g:jedi#completions_enabled = 0 "Disable completions, we only use jedi for go to defintion
  let g:jedi#goto_command = "gd"
  let g:deoplete#enable_at_startup = 1
  set timeoutlen=1000 ttimeoutlen=0
  " Ale settings
  let g:ale_fixers = {'python': ['yapf']}
  "let g:ale_fix_on_save = 1
  " Disable annoying highlights
  let g:ale_set_highlights = 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basics
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set laststatus=2
" Disable swap files
set noswapfile
" Search as you type
:set incsearch
" Enable Mouse
set mouse=a
" Enable Syntax Highlighting
syntax enable
syntax on
" Color schemes!
colorscheme gruvbox
set background=dark
set shell=/bin/sh
" Enable line numbers
set number
set tabstop=4 " Show existing tab with 4 spaces width
set shiftwidth=4 " When indenting with > use 4 spaces"
set expandtab " On pressing tab, insert 4 spaces
" This allows buffers to be hidden if you've modified a buffer.
set hidden
" Show whitespce characters
"set list
"set listchars=tab:→\ ,eol:¬
"set listchars=tab:→\ »\ ,extends:›,precedes:‹,nbsp:·,trail:·
"set listchars=tab:→\ →\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"For statusline to work
let mapleader = ","
" comment / decomment & normal comment behavior
vmap <C-m> gc
" Map contrl+/ to comment
map <C-_> <leader>c<space>
" indent / deindent
vnoremap <Tab> >
vnoremap <S-Tab> <
" Better indentation
vnoremap < <gv
vnoremap > >gv
" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
" Buffer settings
" To open a new empty buffer
nmap <leader>t :enew<cr>
" Move to the next buffer
nmap <leader>s :bn<CR>
"" Move to the previous buffer
nmap <leader>a :bp<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
"" Show all open buffers and their status
nmap <leader>bl :ls<CR>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#ale#enabled = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_override_foldtext = 0
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" commenting should use double slash for c files
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
"map <leader>nn :NERDTreeToggle<cr>
"map <leader>nb :NERDTreeFromBookmark
"map <leader>nf :NERDTreeFind<cr>
"https://stackoverflow.com/a/31631030
function! ToggleNERDTreeFind()
  if g:NERDTree.IsOpen()
    execute ':NERDTreeClose'
  else
    execute ':NERDTreeFind'
  endif
endfunction
map <leader>nn :call ToggleNERDTreeFind()<CR>


map <leader>f :Files<CR>
map <leader><space> :Buffers<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ClipboardYank()
  call system('nc localhost 8377', @@)
endfunction
" Remap y to clipper, if it's running
call system('pbpaste | nc localhost 8377')
if !v:shell_error
  vnoremap <silent> y y:call ClipboardYank()<cr>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use silver searcher if it's installed
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

au FileType markdown setl conceallevel=0
let g:vim_markdown_conceal = 0

" CntrlP Ignore .gitignore stuff
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
