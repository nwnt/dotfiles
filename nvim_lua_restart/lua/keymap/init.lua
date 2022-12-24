local b = require("keymap.binding")
local nmap = b.nmap
local nnoremap = b.nnoremap
local inoremap = b.inoremap
local vnoremap = b.vnoremap
local xnoremap = b.xnoremap

local opts = { noremap = true, silent = true }
-- using space as the leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--[[
--    Normal Mode Mapping
--]]
nnoremap("x", '"_x')
nnoremap("+", "<C-a>")
nnoremap("-", "<C-x>")
nnoremap("dw", 'vb"_d')
nnoremap("<leader>te", ":tabedit<CR>")
nnoremap("<leader>ss", ":split<CR><C-w>w")
nnoremap("<leader>sv", ":vsplit<CR><C-w>w")
nnoremap("<leader>sw", "<C-w>w")
nnoremap("<leader>sc", "<C-w>o")
nnoremap("<leader>;", ":")
nnoremap("\\\\", ":q<CR>") -- Use \\ to quit
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")
nnoremap("<C-Down>", ":resize -2<CR>")
nnoremap("<C-Up>", ":resize +2<CR>")
nnoremap("<C-Left>", ":vertical resize -2<CR>")
nnoremap("<C-Right>", ":vertical resize +2<CR>")
---- Keep the search centered
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z") -- join and then stay on the same line
nnoremap("<leader>d", '"_d')

nnoremap("Y", "yg$")
nnoremap("<leader>y", '"+y')
nmap("<leader>y", '"+y')

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<a-up>", ":bnext<cr>")
nnoremap("<a-down>", ":bprevious<cr>")

-- Quickfix and Location list navigation
nnoremap("\\j", ":cnext<CR>zz")
nnoremap("\\k", ":cprev<CR>zz")
nnoremap("\\n", ":lnext<CR>zz")
nnoremap("\\p", ":lprev<CR>zz")

-- Quickly replace the word the cursor is on
nnoremap("\\s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

nnoremap("z.", "zszH") -- horizontally centering
-- Dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--

--[[
--    Visual Mode Mapping
--]]
vnoremap("<leader>p", '"_dP')
vnoremap("<leader>y", '"+y')
vnoremap("<leader>d", '"_d')
vnoremap("<leader>;", ":")
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
vnoremap("<", "<gv")
vnoremap(">", ">gv")

--[[
--    Visual Block Mode Mapping
--]]
xnoremap("<leader>p", '"_dP')
xnoremap("J", ":m '>+1<CR>gv=gv")
xnoremap("K", ":m '<-2<CR>gv=gv")

--[[
--    Insert Mode Mapping
--]]
inoremap("jk", "<ESC>")
inoremap("<C-a>", "<ESC>^i")
inoremap("<C-e>", "<ESC>g_a")

-- Navigate buffers
--
---- Telescope
--ks("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
--ks("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
--
--
---- INSERT --
--local function t(str)
--    return vim.api.nvim_replace_termcodes(str, true, true, true)
--end
--
---- nope. Look at cmp instead.
---- need these to change from enter to tab
----function _G.tab_to_select()
----    return vim.fn.pumvisible() == 1 and t'<CR>' or t'<Tab>'
----end
----
----function _G.enter_no_select() 
----    return vim.fn.pumvisible() == 1 and t'<ESC>o' or t'<CR>'
----end
----
----function _G.smart_tab()
----    return vim.fn.pumvisible() == 1 and t'<C-P>' or t'<Tab>'
----end
--
----vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
--
---- easy escaping
--ks("i", "jk", "<ESC>", opts)
----ks("i", "<Tab>", "pumvisible() ? <C-N> : <Tab><CR>", opts)
----ks("i", "<CR>", "pumvisible() ? <ESC>o : <CR>", opts)
----ks("i", "<Tab>", "v:lua.tab_to_select()", {expr = true, noremap = true, silent = true})
----ks("i", "<CR>", "v:lua.enter_no_select()", {expr = true, noremap = true, silent = true})
----ks('i', '<Tab>', function()
----    return vim.fn.pumvisible() == 1 and '<CR>' or '<Tab>'
----end, {expr = true})
----ks('i', '<CR>', function()
----    return vim.fn.pumvisible() == 1 and '<ESC>o' or '<CR>'
----end, {expr = true})
--
---- VISUAL --
--ks("v", "<leader>;", ":", opts)
---- Stay in indent mode
--ks("v", "<", "<gv", opts)
--ks("v", ">", ">gv", opts)
--
---- Move text up and down
--ks("v", "J", ":move '>+1<CR>gv=gv", opts)
--ks("v", "K", ":move '<-2<CR>gv=gv", opts)
--ks("v", "p", '"_dP', opts) -- paste send the replaced text to blackhole register
--
---- VISUAL BLOCK --
---- Move text up and down
--ks("x", "J", ":move '>+1<CR>gv=gv", opts)
--ks("x", "K", ":move '<-2<CR>gv=gv", opts)
--
require("keymap.telescope")
require("keymap.hop")
