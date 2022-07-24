local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- shortening function name
local keymap = vim.api.nvim_set_keymap

-- using space as the leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NORMAL --
keymap("n", "<leader>;", ":", opts)
keymap("n", "Q", ":q", opts)
-- Better window movement
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e)", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Keep the search centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Navigate buffers
keymap("n", "<A-Up>", ":bnext<CR>", opts)
keymap("n", "<A-Down>", ":bprevious<CR>", opts)


-- INSERT --
-- easy escaping
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- VISUAL --
keymap("v", "<leader>;", ":", opts)
-- Stay in indent mode
keymap("v", "jk", "<ESC>", opts)
keymap("v", "kj", "<ESC>", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", ":move '>+1<CR>gv=gv", opts)
keymap("v", "K", ":move '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts) -- paste send the replaced text to blackhole register

-- VISUAL BLOCK --
-- Move text up and down
keymap("x", "jk", "<ESC>", opts)
keymap("x", "kj", "<ESC>", opts)
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap("x", "K", ":move '<-2<CR>gv=gv", opts)
