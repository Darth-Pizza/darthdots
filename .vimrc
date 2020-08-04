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
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

" Autocompletion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-tern'
Plug 'ncm2/ncm2-pyclang'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" NCM2 Settings
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" The basics
set encoding=UTF-8
set nocompatible
set number relativenumber
set nobackup
set nowritebackup
syntax on
filetype plugin indent on

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
" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
