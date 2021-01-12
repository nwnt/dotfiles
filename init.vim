" Set {{{
set exrc "Specific customization for each project when doing vim .
set tabstop=4 softtabstop=4
set expandtab "Use spaces instead of tabs
set smartindent "group indenting
set nu "Line number
set rnu "Relative line number
set nohlsearch "No highlight on search
set hidden "Keep buffer in the background without having to save first
set noerrorbells
set nowrap "No word wrapping on multiple lines
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch "Incremental search
set termguicolors
set scrolloff=8 "Getting near the bottom and will keep lines away
set signcolumn=yes
set colorcolumn=80
set completeopt=menuone,noinsert,noselect
set updatetime=50
set foldmethod=indent
set foldenable
set foldlevelstart=10
set foldnestmax=10
" }}}


call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

"#neovim-lsp
"#undotree
"#TreeSitter
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

let mapleader = " "
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

filetype plugin indent on
set backspace=indent,eol,start

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

