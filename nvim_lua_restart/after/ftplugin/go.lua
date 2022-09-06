local vo = vim.opt_local
vo.tabstop = 4
vo.shiftwidth = 4
vo.softtabstop = 4

local b = require("keymap.binding")
local nnoremap = b.nnoremap

nnoremap("<leader>ga", "<cmd>GoAlt<cr>")
nnoremap("<leader>gs", "<cmd>GoAltS<cr>")
nnoremap("<leader>gv", "<cmd>GoAltV<cr>")
