" Plug-ins {{{
call plug#begin('~/.vim/plugged')

" telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Undotree
Plug 'mbbill/undotree'

" UI and Colors
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

" Markdown stuff
Plug 'plasticboy/vim-markdown' " Syntax highlights
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
Plug 'junegunn/limelight.vim' " Spotlight current paragraph
Plug 'junegunn/goyo.vim' " Distraction free full screen

" File explorer
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'ryanoasis/vim-devicons'

" Development tools
Plug 'fatih/vim-go'
Plug 'yggdroot/indentline'
Plug 'sheerun/vim-polyglot'  " A collection of lang packs for vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'

" Utilities 
Plug 'tpope/vim-surround'

" Vimwiki
Plug 'vimwiki/vimwiki'

" Vista.vim showing code outline
Plug 'liuchengxu/vista.vim'

call plug#end()
" }}}
" Key Mappings {{{
let mapleader = " "

nnoremap <leader>s :mksession<CR>
nnoremap gV `[v`]
nnoremap zq q
nnoremap q <ESC>
nnoremap Q :q<CR>
inoremap jk <ESC>
nnoremap H ^
nnoremap L $

nnoremap <leader>y "+y
vnoremap <leader>y "+y
" }}}
" vim:foldmethod=marker:foldlevel=0
