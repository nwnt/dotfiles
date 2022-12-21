vim.cmd('autocmd!')

vim.scriptencoding 	= "utf-8"

local o = vim.opt
local HOME_CACHE = vim.fn.expand("$XDG_CACHE_HOME")

o.encoding              = "utf-8"
o.fileencoding 		    = "utf-8"
o.number 				= true
o.relativenumber		= true
o.title					= true
o.autoindent			= true
o.hlsearch				= true
o.backup 				= false  -- don't create a backup file
o.showcmd				= true
o.cmdheight				= 1
o.laststatus			= 2
o.expandtab				= true	-- use spaces instead of tab
o.scrolloff				= 8
o.sidescrolloff			= 12
o.inccommand            = "split"
o.ignorecase            = false
o.smartcase             = true
o.smarttab              = true
o.showtabline           = 2
o.tabstop               = 4
o.softtabstop           = 2
o.shiftwidth            = 4
o.breakindent           = true
o.autoindent            = true
o.smartindent           = true
o.clipboard             = "unnamedplus"
o.completeopt           = { "menuone", "noselect", "noinsert" } -- for auto complete behaviors
o.conceallevel          = 0
o.mouse                 = "a"
o.pumheight             = 10
o.splitbelow            = true
o.swapfile              = false
o.timeoutlen            = 1000
o.undofile              = true
o.undodir               = HOME_CACHE .. "/.vim/undodir"
o.updatetime            = 300 -- status line update freq
o.numberwidth           = 4 -- number column width
o.colorcolumn           = { 80, 120, 160 }
o.showmatch             = true
o.formatoptions:append { 'r' }

-- Highlight options
o.cursorline            = true -- highlight the current line
o.termguicolors         = true
o.pumblend              = 5
