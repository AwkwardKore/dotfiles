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

" NERDTree
Plug 'https://github.com/scrooloose/nerdtree.git'

" NERDTree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Use vim-airline for status bar
Plug 'vim-airline/vim-airline'

" Use gitgutter for git information on editor
Plug 'airblade/vim-gitgutter'

call plug#end()

" Load NERDTree on startup
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p

" Show hidden files on NERDTree
let NERDTreeShowHidden=1

" Hide certain files on NERDTree
let NERDTreeIgnore=['\.DS_Store$', '\.swp$']

" Open NERDTree-tabs on startup
let g:nerdtree_tabs_open_on_console_startup=1

" Display line numbers by default
set number

" Enable all python highlight
let python_highlight_all=1

" Fix autoindentation for using spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

" Display character on end-of-line
"set listchars=eol:¬
"set list

" Fix backspace problems
set backspace=indent,eol,start

" Enable the list of buffers
let g:airline#extensions#tabline#enabled=1

" Show just the filename
let g:airline#extensions#tabline#fnamemod=':t'
