"  _   _ ________  _________  _____
" | | | |_   _|  \/  || ___ \/  __ \
" | | | | | | | .  . || |_/ /| /  \/
" | | | | | | | |\/| ||    / | |
" \ \_/ /_| |_| |  | || |\ \ | \__/\
"  \___/ \___/\_|  |_/\_| \_| \____/
"
" Retinazer's vimrc
" https://github.com/retinazer/dots

let mapleader=" "

" Install Plugins
call plug#begin('~/.vim/plugged')
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'thaerkh/vim-indentguides'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
" Plug 'jaredgorski/spacecamp'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
call plug#end()

" The basics
set encoding=UTF-8
set nocompatible
set number relativenumber
set nobackup
set nowritebackup
syntax on
filetype plugin indent on

" Set colorscheme
" colorscheme spacecamp

" Tab space and shift width
set ts=2 sw=2
set laststatus=2

" Enable autocompletion
set wildmode=longest,list,full

" Settings for lightline
let g:lightline = { 'colorscheme': 'powerline'}

" Remap switching between splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Toggle NERDTree
map <C-o> :NERDTreeToggle<CR>

" Fix splits
set splitbelow splitright

" Remove trailing whitespace on buffer write
autocmd BufWritePre * %s/\s\+$//e

" Mappings for tabs
nnoremap tn :tabnew<space>

nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Compile SASS
autocmd BufWritePost *.sass,*.scss !sass ./*.s*ss ./main.css

" Compile Groff MS to PDF
autocmd BufWritePost *.ms !groff -ms ./*.ms -T pdf > %:r.pdf

" Ultisnips
" let g:UltiSnipsExpandTrigger="<c-space>"

" Coc Vim Settings
"
" Plugins used:
" coc-tsserver
" coc-json
" coc-html
" coc-css
" coc-ultisnips
" coc-eslint //install eslint through npm

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
" 	\ pumvisible() ? "\<C-n>" :
" 	\ <SID>check_back_space() ? "\<TAB>" :
" 	\ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
" 	let col = col('.') - 1
" 	return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
