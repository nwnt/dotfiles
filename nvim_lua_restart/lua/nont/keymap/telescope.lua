local b = require("nont.keymap.binding")
local nnoremap = b.nnoremap
--local nmap = b.nmap
--local inoremap = b.inoremap
--local vnoremap = b.vnoremap
--local xnoremap = b.xnoremap

nnoremap("<leader>ff",  "<cmd>Telescope find_files<CR>")
nnoremap("<leader>fg",  "<cmd>Telescope live_grep<CR>")

