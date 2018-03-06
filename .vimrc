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
Plug 'mxw/vim-jsx'

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

call plug#end()

" Enable jsx syntax on .js files
let g:jsx_ext_required = 0

" Load NERDTree on startup
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p

" Show hidden files on NERDTree
let NERDTreeShowHidden=1

" Hide specific files on NERDTree
let NERDTreeIgnore=['\.DS_Store$', '\.swp$', '\.git$']

" Enable all python highlight
let python_highlight_all=1

" Fix autoindentation for using spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Fix backspace problems
set backspace=indent,eol,start

" Enable buffer list
let g:airline#extensions#tabline#enabled=1

" Show only the filename on buffer list
let g:airline#extensions#tabline#fnamemod=':t'

" Show end of line character
set listchars=tab:→\ ,trail:·
set list

" Use relative number
set relativenumber
set number

" Display line on current line
set cursorline
