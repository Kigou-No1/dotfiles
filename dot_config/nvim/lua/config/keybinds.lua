local set = vim.keymap.set


vim.g.mapleader = " "

-- telescope
set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

set("n", "<leader>nd", ":Noice dismiss<CR>", "Dismiss notifications")
set("n", "<leader>e", ":Neotree toggle position=right", "Toggle explorer")

