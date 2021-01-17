set encoding=UTF-8
set exrc "Specific customization for each project when doing vim .
set shiftwidth=4 " 4 space tabs
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
set backspace=indent,eol,start "Backspace on the insert mode
set showmatch " highlight matching [{()}]
set lazyredraw " redraw only when needed
set cursorline
" folding
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10
set foldmethod=indent

filetype plugin indent on
syntax enable

set modelines=1 " For init.vim specific fold settings / set to 1 line
