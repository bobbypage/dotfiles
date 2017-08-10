set t_Co=256 "Enable 256 colors

"hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
"hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
"hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE


set nocompatible              " be iMproved, required
filetype off                  " required
set backspace=indent,eol,start
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'sheerun/vim-polyglot'
"Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'ervandew/supertab'
Bundle 'jiangmiao/auto-pairs'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-sleuth'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'szw/vim-maximizer'
Plugin 'dracula/vim'
Plugin 'mkitt/tabline.vim'
Plugin 'mileszs/ack.vim'
Plugin 'yggdroot/indentline'


call vundle#end()            " required
filetype plugin indent on    " required
set clipboard=unnamedplus
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dracula'
if executable('ag')
      let g:ackprg = 'ag --vimgrep'
  endif
"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_override_foldtext = 0

" Disable youcompleteme
"let g:loaded_youcompleteme = 1

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<leader>t'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ 
        \ }


"For lighlight to work
set laststatus=2
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
" Dark Background
"set background=dark
" Theme
"colorscheme solarized 
color dracula


" Enable line numbers
set number

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

" buffers
nmap <leader>t :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>


"nnoremap <C-m>  :MaximizerToggle<CR>

" Tabs
"nnoremap <C-b>  :tabp<CR>
"inoremap <C-b>  <Esc>:tabp<CR>i
"nnoremap <C-n>  :tabN<CR>
"inoremap <C-n>  <Esc>:tabN<CR>i
"nnoremap <C-t>  :tabnew<CR>
"inoremap <C-t>  <Esc>:tabnew<CR>i
"nnoremap <C-k>  :tabclose<CR>

inoremap <C-b>  <Esc>:tabp<CR>i
nnoremap <C-n>  :tabN<CR>
inoremap <C-n>  <Esc>:tabN<CR>i
nnoremap <leader>t  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
"inoremap <C-k>  <Esc>:tabclose<CR>i

" Map contrl+/ to comment
map <C-_> <leader>c<space> 

" commenting should use double slash for c files
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }

" indent / deindent after selecting the text with (⇧ v), (.) to repeat.
"
vnoremap <Tab> >
vnoremap <S-Tab> <

set clipboard^=unnamed

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

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
let NERDTreeMapOpenInTab='\r'
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
 nmap <leader>T :enew<cr>
"
" " Move to the next buffer
 nmap <leader>n :bn<CR>
"
"" Move to the previous buffer
nmap <leader>b :bp<CR>

" Close the current buffer and move to the previous one
" " This replicates the idea of closing a tab
 nmap <leader>bq :bp <BAR> bd #<CR>
"
"" Show all open buffers and their status
nmap <leader>bl :ls<CR>"

if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

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

