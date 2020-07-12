syntax on

set t_Co=256 "Enable 256 colors
set backspace=indent,eol,start

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'dracula/vim'
Plug 'google/vim-searchindex'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-signify'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc.nvim Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Show invisible characters
"set list
"set listchars=tab:›\ ,eol:¬,trail:⋅ "Set the characters for the invisibles


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
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
"inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-rename)

" https://github.com/neoclide/coc.nvim/issues/1249
nmap <silent> gD :vsp<CR><Plug>(coc-definition)<C-w>r<CR>

" List errors
nmap <silent> ge :lopen<CR>

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
" nmap <leader>r <Plug>(coc-rename)

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

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
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


" Enable Syntax Highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" https://github.com/dracula/vim/issues/117#issuecomment-449427739
let g:dracula_colorterm = 0
colorscheme dracula
"set background=dark
set shell=/bin/sh
" Enable line numbers
set number
set tabstop=4 " Show existing tab with 4 spaces width
set shiftwidth=4 " When indenting with > use 4 spaces"
set expandtab " On pressing tab, insert 4 spaces
" This allows buffers to be hidden if you've modified a buffer.
set hidden

"set notimeout
set ttimeout
set ttimeoutlen=0
set timeoutlen=10000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"For statusline to work
let mapleader = ","
" comment / decomment & normal comment behavior
vmap <C-m> gc
" Map contrl+/ to comment
" map <C-_> <leader>c<space>
map <C-_> <plug>NERDCommenterToggle
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

map <leader><space> :Buffers<CR>

map <leader>f :FZF<CR>
let g:coc_user_config = {}
let g:coc_user_config['languageserver'] = {
\   'golang': {
\     'command': 'gopls',
\     'rootPatterns': [
\       'go.mod',
\       '.vim/',
\       '.git/',
\       '.hg/',
\     ],
\     'filetypes': [
\       'go',
\     ]
\   }
\ }

" Quickly edit files nearby
nnoremap <leader>o :edit <C-R>=expand("%:p:h")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='dracula'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#ale#enabled = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_override_foldtext = 0
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" commenting should use double slash for c files
let g:NERDCreateDefaultMappings = 0

let g:NERDCustomDelimiters = {
    \ 'c':          { 'left': '//', 'right': '', 'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'cpp':        { 'left': '//',              'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'haskell':    { 'left': '--',              'leftAlt': '{-', 'rightAlt': '-}' },
    \ 'java':       { 'left': '//',              'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'javascript': { 'left': '//',              'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'matlab':     { 'left': '%'                                                  },
    \ 'ocaml':      { 'left': '(*', 'right': '*)'                                  },
    \ 'python':     { 'left': '#'                                                  },
    \ 'sh':         { 'left': '#'                                                  },
    \ 'tex':        { 'left': '%'                                                  },
    \ 'tmux':       { 'left': '#'                                                  },
    \ 'textpb':     { 'left': '#'                                                  },
    \ }
let g:NERDTreeWinPos = "left"
" Show hidden files
let NERDTreeShowHidden=1
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

noremap <leader>c :PiperSelectActiveFiles<CR>
map <leader>nn :call ToggleNERDTreeFind()<CR>

command VimConfig :e $MYVIMRC
command VimReload :source $MYVIMRC
command CloseAll :%bd

set clipboard+=unnamedplus

" https://vim.fandom.com/wiki/Search_for_visually_selected_text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
