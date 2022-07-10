HOME_CACHE = vim.fn.expand("$XDG_CACHE_HOME")
-- help options
vim.opt.backup = false                      -- don't create a backup file
vim.opt.clipboard = "unnamedplus"           -- system clipboard
vim.opt.cmdheight = 2                       -- nvim cmd line for message displaying
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }     -- for auto complete behaviors
vim.opt.conceallevel = 0                    -- show full markdown syntax
vim.opt.fileencoding = "utf-8"              -- enconding to the written file
vim.opt.hlsearch = true                     -- highlight all matches on previous search pattern
vim.opt.ignorecase = false                  -- case sensitive search
vim.opt.mouse = "a"                         -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                      -- pop up menu height
vim.opt.termguicolors = true

vim.opt.showtabline = 2

vim.opt.expandtab = true                    -- use spaces instead of tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.smartcase = true                    -- for searching with camel cased words
vim.opt.smartindent = true                  -- automatic identation
vim.opt.splitbelow = true                   -- force all horizontal splits to go below current window
vim.opt.swapfile = false                    -- don't create a swapfile
vim.opt.timeoutlen = 1000                   -- time to wait for a mapped sequence to complete
vim.opt.undofile = true                     -- enable persistent undo
vim.opt.undodir = HOME_CACHE .. "/.vim/undodir"
vim.opt.updatetime = 300                    -- status line update frequency
vim.opt.cursorline = true                   -- highlight the current line
vim.opt.number = true                       -- nu
vim.opt.relativenumber = true               -- rnu
vim.opt.numberwidth = 4                     -- number column width
vim.opt.signcolumn = "number"               -- use number col to also display signs
vim.opt.colorcolumn = { 80, 120, 160 }
vim.opt.wrap =  false                       -- display as one long line
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 8
vim.opt.showmatch = true

vim.cmd [[set formatoptions-=o]]
