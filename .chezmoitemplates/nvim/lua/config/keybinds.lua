local set = vim.keymap.set
local builtin = require("telescope.builtin")

-- telescope
set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

set("n", "<leader>nd", ":Noice dismiss<CR>", { desc = "Dismiss notifications" })
set("n", "<leader>e", ":Neotree toggle filesystem position=left<CR>", { desc = "Toggle explorer" })

set("i", "<C-l>", "<Right>")
set("i", "<C-h>", "<Left>")
