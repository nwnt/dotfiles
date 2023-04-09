vim.cmd('autocmd!')

vim.scriptencoding 	= "utf-8"

O = vim.opt
local HOME_CACHE = vim.fn.expand("$XDG_CACHE_HOME")

O.encoding              = "utf-8"
O.fileencoding 		= "utf-8"
O.number 		= true
O.relativenumber	= true
O.title			= true
O.autoindent		= true
O.hlsearch		= true
O.incsearch	        = true
O.backup 		= false  -- don't create a backup file
O.showcmd		= true
O.cmdheight		= 1
O.laststatus		= 2
O.expandtab		= true	-- use spaces instead of tab
O.scrolloff		= 8
O.sidescrolloff		= 12
O.inccommand            = "split"
O.ignorecase            = true
O.smartcase             = true
O.smarttab              = true

O.showtabline           = 2
O.tabstop               = 4
O.softtabstop           = 2
O.shiftwidth            = 4
O.breakindent           = true
O.autoindent            = true
O.smartindent           = true
O.clipboard             = "unnamed"
O.completeopt           = { "menuone", "noselect", "noinsert" } -- for auto complete behaviors
O.conceallevel          = 0
O.mouse                 = "a" -- enable mouse for all modes
O.pumblend              = 10
O.pumheight             = 10
O.splitbelow            = true
O.swapfile              = false
O.timeoutlen            = 1000
O.undofile              = true
O.undodir               = HOME_CACHE .. "/.vim/undodir"
O.updatetime            = 250 -- status line update freq
O.numberwidth           = 4 -- number column width
O.colorcolumn           = { 80, 120, 160 }
O.showmatch             = true
O.formatoptions:append { 'r' }
O.signcolumn            = "yes"

-- Highlight options
O.cursorline            = true -- highlight the current line
O.termguicolors         = true
O.pumblend              = 5

-- Folding
O.foldmethod            = "expr"
O.foldexpr              = "nvim_treesitter#foldexpr()"
O.foldenable            = false
