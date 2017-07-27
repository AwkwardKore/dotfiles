call plug#begin('~/.vim/plugged')

" HTML syntax
Plug 'othree/html5.vim' 

" CSS and SCSS syntax
Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'

" Ruby syntax
Plug 'vim-ruby/vim-ruby'

" Python syntax
Plug 'https://github.com/hdima/python-syntax.git'

" Javascript syntax
Plug 'https://github.com/pangloss/vim-javascript.git'

" NERDTree
Plug 'https://github.com/scrooloose/nerdtree.git'

" NERDTree-tabs
Plug 'jistr/vim-nerdtree-tabs'

" NERDTree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" Load NERDTree on startup
autocmd vimenter * NERDTree

" Show hidden files on NERDTree
let NERDTreeShowHidden=1

" Hide certain files on NERDTree
let NERDTreeIgnore=['\.DS_Store$', '\.swp$']

" Open NERDTree-tabs on startup
let g:nerdtree_tabs_open_on_console_startup=1

" Display line numbers by default
set number

"Enable all python highlight
let python_highlight_all=1
