" Keymap
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" Config
