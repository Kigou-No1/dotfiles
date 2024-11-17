local set = vim.keymap.set
local builtin = require("telescope.builtin")

-- telescope
set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

set("n", "<leader>nd", ":Noice dismiss<CR>", { desc = "Dismiss notifications" })
set("n", "<leader>e", ":Neotree toggle filesystem position=left<CR>", { desc = "Toggle explorer" })

set("n", "<C-a>", ":BufferPrevious<CR>", { desc = "Go to previous tab", noremap = false, silent = false})
set("n", "<C-d>", ":BufferNext<CR>", { desc = "Go to next tab", noremap = false, silent = false})
set("n", "<C-c>", ":BufferClose<CR>", { desc = "Close tab", noremap = false, silent = false})

-- move cursor in insert-mode
set("i", "<C-l>", "<Right>")
set("i", "<C-h>", "<Left>")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ctx)
    set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = true })
    set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = true })
    set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = true })
    set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = true })
    set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { buffer = true })
    set("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { buffer = true })
    set("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { buffer = true })
    set("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", { buffer = true })
    set("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { buffer = true })
    set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = true })
    set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = true })
    set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = true })
    set("n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>", { buffer = true })
    set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", { buffer = true })
    set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", { buffer = true })
    set("n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", { buffer = true })
    set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", { buffer = true })
  end,
})
