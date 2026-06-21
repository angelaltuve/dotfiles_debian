source $VIMRUNTIME/defaults.vim
filetype plugin indent on
syntax on

" General
set nocompatible history=2000 autoread
set nobackup nowritebackup noswapfile
set undofile undodir=~/.vim/undo
set magic backspace=indent,eol,start
set clipboard=unnamedplus hidden cmdheight=2 shortmess+=c

" Interface
set number relativenumber ruler cursorline cursorcolumn
set scrolloff=7 sidescrolloff=5
set wildmenu wildmode=longest:full,full
set wildignore=*.o,*.pyc,*.class,*.swp,*.zip,*.docx,*.jpg,*.png
set showcmd showmode showmatch matchtime=2
set laststatus=2 colorcolumn=100
set noerrorbells novisualbell t_vb= title mouse=a

" Search
set hlsearch incsearch ignorecase smartcase
nnoremap <CR> :nohlsearch<CR><CR>

" Tabs & Indent
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set smarttab shiftround autoindent smartindent

" Folding
set foldenable foldmethod=indent foldlevel=99
nnoremap <Space> za

" Files & Encoding
set encoding=utf-8 fileencodings=ucs-bom,utf-8,latin1
set fileformats=unix,dos,mac formatoptions+=mB

" Splits
set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=20

" Mappings
inoremap jk <Esc>
nnoremap j gj
nnoremap k gk
nnoremap <F2> :w<CR>
inoremap <F2> <Esc>:w<CR>
nnoremap <F3> :q<CR>
nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>a ggVG
nnoremap <leader>n :set number! relativenumber!<CR>
nnoremap <leader>c :%s/\s\+$//e<CR>

" Filetype
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab

" Trailing whitespace highlight
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Restore cursor position after reopen
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
