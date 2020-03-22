" ---- c0z0's .vimrc ----

" ---- PLUGINS ----
call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'wikitopian/hardmode'
Plug 'justinmk/vim-sneak'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'phanviet/vim-monokai-pro'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'

Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()


" ---- PLUGIN CONFIGURATIONS ----

" Hard mode
let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = 'Don''t use this!'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
let g:prettier#config#tab_width = 2
" use tabs instead of spaces: true, false, or auto (use the expandtab setting).
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'

let g:sneak#label = 1

" Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-b> :NERDTreeToggle<CR>

" ---- GENERAL CONFIGURATIONS ----

set nocompatible
set number

" Display all matching files when we tab complete

" Theme
set termguicolors
set termguicolors
colorscheme monokai_pro

" Transparent background
hi NonText ctermbg=none guibg=NONE
hi Normal guibg=NONE ctermbg=NONE
highlight clear LineNr
highlight clear SignColumn

hi TabLine      guifg=#000 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
hi TabLineSel   guifg=#fff guibg=DarkMagenta gui=bold ctermfg=Red ctermbg=Red cterm=bold
hi TabLineFill  guifg=#999 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
let g:airline_theme='minimalist'


filetype plugin indent on

" always show the sign column, e.g. where lint errors are marked
set signcolumn=yes

" highlight search result
set hlsearch
" ignore search case
set ignorecase
" unless you use capitals
set smartcase

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" highlight cursorline
set cursorline

" relative number lines
set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" move lines up and down with ALT+J/K
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

nnoremap <C-k> :GitFiles<CR>
inoremap <C-k> :GitFiles<CR>
vnoremap <C-k> :GitFiles<CR>

" enable mouse selection
let g:ctrlp_custom_ignore = '\v[\/](node_modules|dist)$'
set mouse=a

" increase max number of files you can open as tabs with -p command line option
set tabpagemax=50

" make swapfiles be kept in a central location to avoid polluting file system
set directory^=$HOME/.vim/swapfiles//

" use undodir for persistent undoing across file closure
set undodir=~/.vim/undodir
set undofile

" visual autocomplete for command menu
set wildmenu
" make tab completion in wildmenu work like bash
set wildmode=longest:full,full
set wildmenu

" don't show '-- INSERT --'
set noshowmode

" make backspace work like you'd expect in insert mode
set backspace=indent,eol,start

" use system clipboard as default clipboard
set clipboard=unnamedplus

" number of lines to keep above and below the cursor
set scrolloff=5


" ======== COMPLETION ========

" Use tab to trigger completion and tab/shift-tab to navigate results
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Close preview pane once completion is
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" use ctrl-j, ctrl-k for selecting omni completion entries
inoremap <expr> <C-j> pumvisible() ? '<C-n>' : ''
inoremap <expr> <C-k> pumvisible() ? '<C-p>' : ''

" select omni completion entry with enter (always supress newline)
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" Coc configs
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
command! Rename :call CocActionAsync('rename')
nmap <F2> <Plug>(coc-rename)
nnoremap <M-r> :Rename<Cr>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
