" Core Vim Settings {{{

set encoding=UTF-8
set tabstop=4 softtabstop=4
set expandtab "Use spaces instead of tabs
set smartindent "group indenting
set nu "Line number
set rnu "Relative line number
set hlsearch "No highlight on search
set hidden "Keep buffer in the background without having to save first
set background=dark
set noerrorbells
set nowrap "No word wrapping on multiple lines
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set incsearch "Incremental search
set termguicolors
set scrolloff=5 "Getting near the bottom and will keep lines away
set signcolumn=yes
set colorcolumn=80,120,160
set completeopt=menuone,noinsert,noselect
set updatetime=100 " statusline update frequency
set backspace=indent,eol,start "Backspace on the insert mode
set showmatch " highlight matching [{()}]
set lazyredraw " redraw only when needed
set cursorline
" folding
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10
set foldmethod=indent

set mouse=a

filetype plugin indent on
syntax enable

set modelines=1 " For init.vim specific fold settings / set to 1 line


let g:python3_host_prog='/usr/bin/python3'

" }}}
" Plug-ins {{{
call plug#begin('$XDG_DATA_HOME/plugged')

" telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Undotree
Plug 'mbbill/undotree'

" UI and Colors
Plug 'gruvbox-community/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'tiagovla/tokyodark.nvim' 
Plug 'sjl/badwolf'
Plug 'tstelzer/welpe.vim'
Plug 'jacoborus/tender.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'sainnhe/gruvbox-material'
Plug 'rebelot/kanagawa.nvim'


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
Plug 'AndrewRadev/splitjoin.vim'
Plug 'yggdroot/indentline'
Plug 'sheerun/vim-polyglot'  " A collection of lang packs for vim
Plug 'BurntSushi/ripgrep'
Plug 'folke/lua-dev.nvim'

" Neovim LSP stuff
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'windwp/nvim-autopairs'

" Utilities 
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'mhinz/vim-startify'
Plug 'dyng/ctrlsf.vim'

" Vimwiki
Plug 'vimwiki/vimwiki'

call plug#end()

" }}}
" Core Vim Key Mappings {{{
let mapleader = " "

nnoremap <leader>s :mksession<CR>
nnoremap gV `[v`]
nnoremap <silent>Q :q<CR>
nnoremap <leader>; :
vnoremap <leader>; :

" Jump list mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Keeping the search centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Window movement mapping
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <F10> "+p
nnoremap <silent><leader>= :source $MYVIMRC<enter>

" Insert mode shortcuts
inoremap jk <ESC>
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
inoremap <C-n> <C-o>%<C-o>%<right><space>
inoremap <M-;> <ESC>A;
inoremap <M-,> <ESC>A,
inoremap <M-l> <C-o>A
inoremap <M-h> <C-o>^
inoremap <M-}> <ESC>]}a
inoremap <M-{> <ESC>[{a
inoremap <M-)> <ESC>])a
inoremap <M-(> <ESC>[(a
inoremap <M-'> <C-o>f"<right>
" Undo break points
inoremap , ,<C-G>u
inoremap . .<C-G>u
inoremap [ [<C-G>u
inoremap ! !<C-G>u
inoremap ? ?<C-G>u

" Moving text with the cursor
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" }}}
" Custom Functions {{{

" }}}
" Autocmds {{{

" Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.md setlocal spell spelllang=en_us

" }}}
" Vim-Surround Config and Keymap {{{
nmap <leader>0 ysiw
" }}}
" FZF Plugin Config {{{
" Let the :Files command show all files in the repo (including any hidden)
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

" fzf buffer search
nmap <silent><leader>/b :BLines!<CR>
" fzf project search
nmap <silent><leader>/? :Rg!<CR>
" fzf file name search 
nmap <silent><leader>/f :Files!<CR>
" fzf command search
nmap <silent><leader>/c :Commands!<CR>
" }}}
" Vim-Go Plugin Config {{{

" Sharing gopls with nvim_lsp
" Make sure you run the following: gopls -listen="unix;/tmp/gopls-daemon-socket"
let g:go_gopls_enabled = 1
let g:go_gopls_options = ['-remote=unix;/tmp/gopls-daemon-socket', '-logfile', '/tmp/vim-gopls.log']
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_referrers_mode = 'gopls'

" disabling vim-go shortcut
let g:go_def_mapping_enabled = 1

"
" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

" Status line types/signatures
let g:go_auto_type_info = 0

" Use Pop-up window for doc
let g:go_doc_popup_window = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>gr <Plug>(go-run)
autocmd FileType go nmap <leader>gt <Plug>(go-test)
autocmd FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" }}}
" Limelight Plugin Config {{{

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = '#83a598'

"Goyo integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" }}}
" NERDTree Git Plugin Config {{{

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" }}}
" NERDTree Syntax Highlight Config {{{

" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 
" " Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {} 
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue 
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {} 
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange 
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {} 
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red 

" }}}
" NERDTree Core Plugin Config {{{

let g:NERDTreeShowHidden = 1 
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed 
" " Toggle
noremap <silent> <leader>nt :NERDTreeToggle<CR>
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
nnoremap <leader>nf :NERDTreeFind<bar> :vertical resize 45<CR>

" }}}
" Treesitter Plugin Config {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {

    ensure_isntall = "all", 

    incremental_selection = {
    enable = true,
    keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
        },
    },

    highlight = {
        enable = true,
    },

}
EOF
" }}}
" Telescope Plugin Config {{{
" Keymap
lua require('telescope').setup{ defaults = { file_ignore_patterns = {"vendor"} } }
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" Config
" }}}
" Undotree Plugin Config {{{

set undodir=~/.config/undodir
set undofile 

nnoremap <silent> <leader>u :UndotreeToggle<CR>
" }}}
" Vim-DevIcons Plugin Config {{{

" " Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige 
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue 

" }}}
" ultisnips Plugin Config {{{
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
" }}}
" Vimwiki Plugin Config {{{

let g:vimwiki_list = [{'path': '~/Documents/wiki',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" }}}
" Additional Lua Config {{{

lua << EOF
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.sumneko_lua.setup{}

require'lspconfig'.gopls.setup{
  cmd = {"gopls", "-remote=unix;/tmp/gopls-daemon-socket"},
  capabailities = capabilities,
  on_attach = function() 
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})
    vim.keymap.set("n", "cf", vim.lsp.buf.formatting, {buffer=0})
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, {buffer=0})
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, {buffer=0})
    vim.keymap.set("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", {buffer=0})

  end,
}

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'nvim_lsp_signature_help' }
  }, {
    { name = 'buffer' },
  })
})

require('nvim-autopairs').setup{}

EOF

" }}}
" vim:foldmethod=marker:foldlevel=0
