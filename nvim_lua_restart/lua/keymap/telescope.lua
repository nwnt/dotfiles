local tel = require("telescope.builtin")
local theme = require("telescope.themes")

local function project_search()
    tel.grep_string( {
            search = vim.fn.input({
                prompt = "Grep > "
            })
        }
    )
end

--vim.keymap.set("n", "<leader>f?", tel.oldfiles, { desc = "[fo] [F]ind recently [O]pened files"})
vim.keymap.set("n", "<leader>fc", function()
    tel.current_buffer_fuzzy_find(theme.get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, {desc = "[fc] [F]uzzily search in [C]urrent buffer"})

vim.keymap.set("n", "<leader>ff", tel.find_files, {desc = "[ff] [F]ind [F]iles"})
vim.keymap.set("n", "<leader>fg", tel.live_grep, {desc = "[fb] [F]ind by live [G]"})
vim.keymap.set("n", "<leader>fo", tel.buffers, {desc = "[fo] [F]ind in existing [O]pen buffers"})
vim.keymap.set("n", "<leader>fh", tel.help_tags, {desc = "[fh] [F]ind in [H]elp tags"})
vim.keymap.set("n", "<leader>fk", tel.keymaps, {desc = "[fk] [F]ind [K]eymaps"})
vim.keymap.set("n", "<leader>f/", project_search, {desc = "[f/] Find in project"})
