HOME_CACHE = vim.fn.expand("$XDG_CACHE_HOME")

local options = {
    backup = false,                      -- don't create a backup file
    clipboard = "unnamedplus",           -- system clipboard
    cmdheight = 2,                      -- nvim cmd line for message displaying
    completeopt = { "menuone", "noselect", "noinsert" },     -- for auto complete behaviors
    conceallevel = 0,                    -- show full markdown syntax
    fileencoding = "utf-8",              -- enconding to the written file
    hlsearch = true,                     -- highlight all matches on previous search pattern
    ignorecase = false,                  -- case sensitive search
    mouse = "a",                         -- allow the mouse to be used in neovim
    pumheight = 10,                      -- pop up menu height
    termguicolors = true,
    showtabline = 2,
    expandtab = true,                    -- use spaces instead of tabs
    tabstop = 2,
    softtabstop = 2,
    shiftwidth = 2,
    smartcase = true,                    -- for searching with camel cased words
    smartindent = true,                  -- automatic identation
    splitbelow = true,                   -- force all horizontal splits to go below current window
    swapfile = false,                    -- don't create a swapfile
    timeoutlen = 1000,                   -- time to wait for a mapped sequence to complete
    undofile = true,                     -- enable persistent undo
    undodir = HOME_CACHE .. "/.vim/undodir",
    updatetime = 300,                    -- status line update frequency
    cursorline = true,                   -- highlight the current line
    number = true,                       -- nu
    relativenumber = true,               -- rnu
    numberwidth = 4,                     -- number column width
    signcolumn = "number",               -- use number col to also display signs
    colorcolumn = { 80, 120, 160 },
    wrap =  false,                       -- display as one long line
    scrolloff = 2,
    sidescrolloff = 8,
    showmatch = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd [[set formatoptions-=o]]
