local ok, _ = pcall(require, "hop")
if not ok then return end

local b = require("keymap.binding")
local nnoremap = b.nnoremap
--nnoremap("f", hop.hint_char1(horizontal_forward_opts))
--nnoremap("F", hop.hint_char1(horizontal_backward_opts))
nnoremap("f", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>")
nnoremap("F", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>")
nnoremap("t", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>")
nnoremap("T", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>")
