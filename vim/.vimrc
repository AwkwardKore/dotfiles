" =========================================================
"                         PLUGINS
" =========================================================
call plug#begin()

" Javascript syntax
Plug 'pangloss/vim-javascript'

" JSX syntax highlight
Plug 'maxmellon/vim-jsx-pretty'

" Graphql syntax highlight
Plug 'jparise/vim-graphql'

" NERDTree
Plug 'preservim/nerdtree'

" NERDTree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Use vim-airline for status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Use gitgutter for git information on editor
Plug 'airblade/vim-gitgutter'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Vim material monokai theme
Plug 'AwkwardKore/vim-monokai'

" Change surrounding
Plug 'tpope/vim-surround'

" Vue.js syntax highlighting
Plug 'leafOfTree/vim-vue-plugin'

" Emmet plugin for expanding abbreviations
Plug 'mattn/emmet-vim'

" Conquer of Completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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

" Show sign column on file buffers
autocmd BufReadPre,FileReadPre * :setlocal scl=yes

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
map <C-m> :NERDTreeFind<CR>

" Display 'NERDTree' on NERDTree status line instead of root path
let g:NERDTreeStatusline='NERDTree'

" =========================================================
"                 Conquer of Completion
" =========================================================

let g:coc_global_extensions=['coc-tsserver', 'coc-eslint', 'coc-prettier']

" Use '[g' and ']g' to navigate between diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

" Use F for mapping COC-quickfix
nnoremap <silent> F <Plug>(coc-fix-current)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" =========================================================
"                        EMMET
" =========================================================

" Enable only on javascript, html and css files
let g:user_emmet_install_global=0
autocmd FileType html,css,javascript,javascript.jsx,typescript,typescriptreact,vue EmmetInstall

" =========================================================
"                  SYNTAX HIGHLIGHTING
" =========================================================

let g:vim_vue_plugin_config = {
\ 'syntax': {
\   'template': ['html'],
\   'script': ['javascript'],
\   'style': ['scss'],
\ },
\ 'full_syntax': [],
\ 'initial_indent': [],
\ 'attribute': 0,
\ 'keyword': 0,
\ 'foldexpr': 0,
\ 'debug': 0,
\}

" =========================================================
"                     VIM-AIRLINE
" =========================================================

" Enable buffer list
let g:airline#extensions#tabline#enabled=1

" Show only the filename with extension on buffer list
let g:airline#extensions#tabline#formatter='short_path'

" Show the buffer number on buffer list
let g:airline#extensions#tabline#buffer_nr_show = 1

" Reload buffer list when deleting buffers
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

" Theme
let g:airline_theme='base16_monokai'

" =========================================================
"                   FZF FUZZY FINDER
" =========================================================

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-o> :Buffers<CR>
nnoremap <silent> <C-i> :GFiles?<CR>
nnoremap <silent> <C-a> :Ag<CR>
nnoremap <silent> <C-s> :Ag <c-r>=expand("<cword>")<cr><CR>
nnoremap <silent> <C-c> :Commits<CR>

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--exact --delimiter : --nth 4..'}, 'up:50%'), <bang>0)

" =========================================================
"                         THEME
" =========================================================

set re=0

syntax enable

if exists("$TMUX")
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Color support
set t_Co=256
if (has('termguicolors'))
  set termguicolors
endif

colorscheme monokai
