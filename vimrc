"Vim-plug plugin manager
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/wincent/command-t.git'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'markdown'] }
Plug 'https://github.com/w0rp/ale'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/ternjs/tern_for_vim'
Plug 'https://github.com/altercation/vim-colors-solarized'
Plug 'https://github.com/mxw/vim-jsx.git'
call plug#end()

"Mapping <Leader>
let mapleader = ','

"Normal backspace
set backspace=2

"Map Prettier <Leader>p
nmap <Leader>p <Plug>(Prettier)

"JSX syntax highlights does not require .jsx extension
let g:jsx_ext_required = 0 

"Show line numer
set number

set hlsearch

"Always show status line
set laststatus=2

"Turno on omnicomplete for autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"Gdiff defaults to vsplit
set diffopt+=vertical

"Show branchname in statusline
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P 

"Saving files with Ctrl+S
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>

"Moving between window splits with Ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Clear search with double Esc
nnoremap <esc><esc> :noh<return>

"NERDTree ignores node modules
let NERDTreeIgnore=['node_modules']

"NERDTree properly opens single files dir
:let NERDTreeCascadeOpenSingleChildDir=1

"NERTree F2 is toggle
map <F2> :NERDTreeToggle<CR>

"NERDTree find current file in tree
nmap <F3> :NERDTreeFind<CR>

"CommandT ignores node_modules dir
let g:CommandTWildIgnore='*/node_modules/*'

filetype plugin indent on
set nocompatible
syntax on

" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

"YouCompleteMe disable function definition split window
set completeopt-=preview

"Highligh current line <Leader>c
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! <CR>

"Solarized color theme settins
syntax enable
set background=dark
colorscheme Solarized

" max line lengh that prettier will wrap on
let g:Prettier#config#print_width = 85

" number of spaces per indentation level
let g:Prettier#config#tab_width = 2

" use tabs over spaces
let g:Prettier#config#use_tabs = 'false'

" print semicolons
let g:Prettier#config#semi = 'true'

" single quotes over double quotes
let g:Prettier#config#single_quote = 'true'

" print spaces between brackets
let g:Prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
let g:Prettier#config#jsx_bracket_same_line = 'false'

" none|es5|all
let g:Prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|postcss
let g:Prettier#config#parser = 'babylon'
