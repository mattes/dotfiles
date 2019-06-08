" Disable backwards quirks
set nocompatible

" Allow file type specific macros
filetype plugin indent on

" Enable mouse support
set mouse=a

" show line numbers
set number
set nowrap

" Use space key as leader key
let mapleader = "\<Space>"

" Intent with 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent


" Don't use backup files, we have Git for that
set nobackup
set noswapfile
set nowritebackup

" Fix mouse clicks for big windows
" https://stackoverflow.com/a/19253251/2142441
"set ttymouse=sgr

"set backspace=2 " Make DELETE work like normal

"set autoread
"au CursorHold * checktime
"
" Load plugins ...
call plug#begin('~/.local/share/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'NLKNguyen/papercolor-theme'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

Plug 'mdempsky/gocode' " , { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }


Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'hashivim/vim-terraform'

call plug#end()

nnoremap <Leader>o :CtrlP<CR>

nnoremap <Leader>d :GoDef<CR>
nnoremap <Leader>D :GoDefPop<CR>
nnoremap <Leader>i :GoImports<CR>
nnoremap <Leader>e :GoIfErr<CR>

" Write file
map <Leader>w :w<CR>

" Create default split
map <Leader>n :tabnew<CR>:vsplit<CR>:vsplit<CR> 

" <Tab> to cycle through splits
noremap <Tab> <C-w>w
noremap <S-Tab> <C-w>p

" Duplicate line
nnoremap dl mzyyP

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Reload vimrc
map <leader>r :source $MYVIMRC<CR>

" Configure CtrlP
let g:ctrlp_user_command = "ripgrep.rg --no-ignore --hidden -g '!vendor' -g '!node_modules' -g '!.git' --files %s"
let g:ctrlp_use_caching = 0
" let g:ctrlp_user_command = "find %s -type f -not -path '*/\.git/*' -maxdepth 10"
" ag %s --files-with-matches --ignore-case --hidden -g ""'
" ['.git/', 'git ls-files --cached --others --exclude-standard %s']

" Configure Deoplete
let g:deoplete#enable_at_startup = 1

syntax enable
set background=light
colorscheme PaperColor

let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ }


" Configure Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
"let g:deoplete#sources#go#cgo = 1

autocmd FileType go nmap <Leader>i <Plug>(go-info)

" let g:go_play_open_browser = 0

let g:terraform_fmt_on_save = 1

"au FileType go nmap <Leader>gd <Plug>(go-doc-browser)

" npm install -g prettier
" https://github.com/jlongster/prettier
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * Neoformat
" augroup END

"set foldmethod=manual 
"set ttyfast
"set lazyredraw
"set re=1
"set norelativenumber

" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }


"filetype plugin indent on
"autocmd FileType yaml setl indentkeys-=<:>
"

" set clipboard+=unnamedplus

map <Leader>' :registers<CR>

" Y yanks to system clipboard
" (whereas y yanks to unnamed register)
vnoremap y "*y | ""y

" P pastes from system clipboard
" (whereas p pastes from unnamed register)
nmap <Leader>p "*p
nmap <Leader>P "*P

let g:clipboard = {
      \   'name': 'osx-bridge',
      \   'copy': {
      \      '+': 'pbcopy',
      \      '*': 'pbcopy',
      \    },
      \   'paste': {
      \      '+': 'pbpaste',
      \      '*': 'pbpaste',
      \   },
      \   'cache_enabled': 0,
      \ }

