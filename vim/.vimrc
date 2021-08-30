" =========================================================
"                         PLUGINS
" =========================================================
call plug#begin('~/.vim/plugged')

" HTML syntax
Plug 'othree/html5.vim'

" Rails plugin
Plug 'tpope/vim-rails'

" Javascript syntax
Plug 'pangloss/vim-javascript'

" Typescript syntax
Plug 'leafgarland/typescript-vim'

" TSX syntax support
Plug 'peitalin/vim-jsx-typescript'

" JSX syntax highlight
Plug 'mxw/vim-jsx'

" SCSS syntax highlight
Plug 'cakebaker/scss-syntax.vim'

" NERDTree
Plug 'preservim/nerdtree', { 'tag': '6.10.10' }

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
Plug 'AwkwardKore/vim-material-monokai'

" Change surrounding
Plug 'tpope/vim-surround'

" Vue.js syntax highlighting
Plug 'leafOfTree/vim-vue-plugin', { 'tag': 'v2021_03_29' }

" Emmet plugin for expanding abbreviations
Plug 'mattn/emmet-vim'

call plug#end()

" =========================================================
"                   GENERAL SETTINGS
" =========================================================

" Set encoding to utf-8
set encoding=utf-8

" Change autoindentation to use spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

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

" Ask to save changes when closing buffer with unsaved changes
set confirm

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
"                        EMMET
" =========================================================

" Change emmet leader key from <C-Y> to ,
let g:user_emmet_leader_key=','

" Enable only on javascript, html and css files
let g:user_emmet_install_global=0
autocmd FileType html,css,javascript,javascript.jsx,typescript EmmetInstall

" =========================================================
"                  SYNTAX HIGHLIGHTING
" =========================================================

" Enable all python highlight
let python_highlight_all=1

" Load all syntax files in runtimepath to enable related syntax plugins
let g:vim_vue_plugin_load_full_syntax=1

" Enable sass syntax on vue files
let g:vim_vue_plugin_use_scss=1

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
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --hidden $1 -U'
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
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
set t_Co=256
set termguicolors
colorscheme material-monokai
let g:airline_theme='materialmonokai'
