" =========================================================
"                         PLUGINS
" =========================================================
call plug#begin('~/.vim/plugged')

" HTML syntax
Plug 'othree/html5.vim'

" CSS and SCSS syntax
Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'

" Ruby syntax
Plug 'vim-ruby/vim-ruby'

" Rails plugin
Plug 'https://github.com/tpope/vim-rails.git'

" Python syntax
Plug 'kh3phr3n/python-syntax'

" Javascript syntax
Plug 'https://github.com/pangloss/vim-javascript.git'

" JSX syntax
Plug 'maxmellon/vim-jsx-pretty'

" NERDTree
Plug 'https://github.com/scrooloose/nerdtree.git'

" NERDTree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Use vim-airline for status bar
Plug 'vim-airline/vim-airline'

" Use gitgutter for git information on editor
Plug 'airblade/vim-gitgutter'

" Use ctrl p for fuzzy finder
Plug 'kien/ctrlp.vim'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Vim material monokai theme
Plug 'https://github.com/AwkwardKore/vim-material-monokai.git'

" Change surrounding
Plug 'tpope/vim-surround'

call plug#end()

" =========================================================
"                   GENERAL SETTINGS
" =========================================================

" Set encoding to utf-8
set encoding=utf-8

" Change autoindentation to use spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Use 4 tab spaces when using .php extension
au FileType php set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Show end of line character
set listchars=tab:→\ ,trail:·
set list

" Display line on current line
set cursorline

" Change terminal's title
set title

" Use relative number
set relativenumber
set number

" Change key code delays
set ttimeoutlen=10

" Change updatetime to 100 ms
set updatetime=100

" Setup persistent undo
call system("mkdir -p $HOME/.vim/undo")
set undodir=$HOME/.vim/undo/
set undofile

" Hide buffers instead of closing them when moving between buffers
set hidden

" Remember more commands and search history
set history=1000

" Modify the maximum number of changes that can be undone
set undolevels=1000

" Remap movement between splits for easier navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" =========================================================
"                       NERDTREE
" =========================================================

" Load NERDTree on startup
autocmd vimenter * NERDTree %:p:h
autocmd VimEnter * wincmd p

" Show hidden files on NERDTree
let NERDTreeShowHidden=1

" Hide specific files on NERDTree
let NERDTreeIgnore=['\.DS_Store$', '\.swp$', '\.git$']

" Enable line numbers on NERDTree
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

" Hide 'Press ? for help' on NERDTree
let NERDTreeMinimalUI=1

" Change NERDTree size
let NERDTreeWinSize=35

" Map Ctrl-n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Display 'NERDTree' on NERDTree status line instead of root path
let g:NERDTreeStatusline='NERDTree'

" =========================================================
"                  SYNTAX HIGHLIGHTING
" =========================================================

" Enable jsx syntax on .js files
let g:jsx_ext_required=0

" Enable all python highlight
let python_highlight_all=1

" =========================================================
"                     VIM-AIRLINE
" =========================================================

" Enable buffer list
let g:airline#extensions#tabline#enabled=1

" Show only the filename with extension on buffer list
let g:airline#extensions#tabline#formatter='unique_tail'

" Show the buffer number on buffer list
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#buffer_nr_format='%s '

" Reload buffer list when deleting buffers
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

" =========================================================
"                   CTRLP FUZZY FINDER
" =========================================================

" Disable caching
let g:ctrlp_use_caching = 0

" Use silver searcher
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --hidden $1'
endif

" Ignore spaces
let g:ctrlp_abbrev = {
  \ 'abbrevs': [
    \ {
      \ 'pattern': ' ',
      \ 'expanded': '',
      \ 'mode': 'fprz',
    \ },
  \ ]
\ }

" =========================================================
"                         THEME
" =========================================================

" Configure theme to use material-monokai
set background=dark
set termguicolors
colorscheme material-monokai
let g:airline_theme='materialmonokai'
