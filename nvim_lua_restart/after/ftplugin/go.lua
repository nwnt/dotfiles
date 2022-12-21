local vo = vim.opt_local
vo.tabstop = 4
vo.shiftwidth = 4
vo.softtabstop = 4

local ok, _ = pcall(require, "go")
if not ok then print "couldn't load go.nvim" end

local b = require("keymap.binding")
local nnoremap = b.nnoremap

nnoremap("<leader>ga", "<cmd>GoAlt<cr>")
nnoremap("<leader>gs", "<cmd>GoAltS<cr>")
nnoremap("<leader>gv", "<cmd>GoAltV<cr>")
nnoremap("<leader>gt", "<cmd>GoTest<cr>")

-- Run gofmt on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)

-- Need to add auto format and (may not need this) import
