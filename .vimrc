" ---- c0z0's .vimrc ----

" ---- PLUGINS ----
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'phanviet/vim-monokai-pro'
Plug 'preservim/nerdtree'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

Plug 'HerringtonDarkholme/yats.vim'

call plug#end()


" ---- PLUGIN CONFIGURATIONS ----

" Prettier
let g:prettier#config#tab_width = 2

" use tabs instead of spaces: true, false, or auto (use the expandtab setting).
" default: 'auto'
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#single_quote = 'true'


" Ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'typescriptreact': ['tsserver', 'eslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \    'typescript': ['prettier'],
 \ }
let g:ale_fix_on_save = 0


" Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-b> :NERDTreeToggle<CR>


" ---- GENERAL CONFIGURATIONS ----

set number

" Theme
set termguicolors
set termguicolors
colorscheme monokai_pro
" Transparent background
hi NonText ctermbg=none guibg=NONE
hi Normal guibg=NONE ctermbg=NONE
highlight clear LineNr
highlight clear SignColumn

hi TabLineFill ctermfg=none ctermbg=none
hi TabLine ctermfg=none ctermbg=none
hi TabLineSel ctermfg=none ctermbg=none
let g:airline_theme='minimalist'


filetype plugin indent on


" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" move lines up and down with ALT+J/K
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
