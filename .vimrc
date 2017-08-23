set t_Co=256 "Enable 256 colors

"hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
"hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
"hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE


set nocompatible              " be iMproved, required
filetype off                  " required
set backspace=indent,eol,start
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin('~/.vim/plugged')
if !has('nvim')
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
endif

if has('nvim')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'zchee/deoplete-go'
Plug 'w0rp/ale'
endif

Plug 'tpope/vim-fugitive'
Plug 'VundleVim/Vundle.vim'
Plug 'flazz/vim-colorschemes'
Plug 'sheerun/vim-polyglot'
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
"Plug 'vim-syntastic/syntastic'
"Plug 'ervandew/supertab'
"Bundle 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go'
Plug 'tpope/vim-sleuth'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'szw/vim-maximizer'
Plug 'dracula/vim'
Plug 'mkitt/tabline.vim'
Plug 'mileszs/ack.vim'
Plug 'yggdroot/indentline'

call plug#end()            " required

if has('nvim')
let g:loaded_youcompleteme = 1
let g:deoplete#enable_at_startup = 1
set timeoutlen=1000 ttimeoutlen=0
endif
filetype plugin indent on    " required
set omnifunc=syntaxcomplete#Complete
"set clipboard=unnamedplus
let g:airline#extensions#tabline#buffer_nr_show = 1

"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dracula'
if executable('ag')
      let g:ackprg = 'ag --vimgrep'
endif

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_override_foldtext = 0

" Disable youcompleteme
"let g:loaded_youcompleteme = 1


"For statusline to work
set laststatus=2

"nnoremap <SPACE> <Nop>
let mapleader = ","

" Disable swap files
set noswapfile

" Search as you type
:set incsearch

" Enable Mouse
set mouse=a 
" Enable Syntax Highlighting
syntax enable
syntax on
color dracula

" Enable line numbers
set number

" Show whitespce characters
"set list
"set listchars=tab:→\ ,eol:¬
"set listchars=tab:→\ »\ ,extends:›,precedes:‹,nbsp:·,trail:·
"set listchars=tab:→\ →\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨



" Cut, Paste, Copy
vmap <C-x> d
vmap <C-v> p
vmap <C-c> y
vmap <C-w> S
" comment / decomment & normal comment behavior
vmap <C-m> gc

nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>

" Map contrl+/ to comment
map <C-_> <leader>c<space> 

" commenting should use double slash for c files
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }

" indent / deindent after selecting the text with (⇧ v), (.) to repeat.
"
vnoremap <Tab> >
vnoremap <S-Tab> <

set tabstop=4 " Show existing tab with 4 spaces width
set shiftwidth=4 " When indenting with > use 4 spaces"
set expandtab " On pressing tab, insert 4 spaces

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

"Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" run Syntastic manually by doing :SyntasticInfo
let g:syntastic_mode_map={'mode': 'passive'}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Python
let g:syntastic_python_checkers=['pyflakes']

 " Javascript
let g:syntastic_javascript_checkers = ['jshint']

" Go
map <leader>s :SyntasticCheck<CR>
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck', 'govet']

let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let NERDTreeMapOpenInTab='\r'
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" You Complete Me
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=/bin/sh

" http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
"
" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'"

"set cursorline

" This allows buffers to be hidden if you've modified a buffer.
" " This is almost a must if you wish to use buffers in this way.
set hidden
"
"" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
 nmap <leader>t :enew<cr>
"
" " Move to the next buffer
nmap <leader>s :bn<CR>
"
"" Move to the previous buffer
nmap <leader>a :bp<CR>

" Close the current buffer and move to the previous one
" " This replicates the idea of closing a tab
 nmap <leader>bq :bp <BAR> bd #<CR>
"
"" Show all open buffers and their status
nmap <leader>bl :ls<CR>"

function! ClipboardYank()
        "call system('xclip -i -selection clipboard', @@)
        call system('nc localhost 8377', @@)
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>

" Check if clipper running
call system('nc -z localhost 8377')
if !v:shell_error
      vnoremap <silent> y y:call ClipboardYank()<cr>
endif


au FileType markdown setl conceallevel=0
let g:vim_markdown_conceal = 0
