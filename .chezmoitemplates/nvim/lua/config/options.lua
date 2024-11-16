local opt = vim.opt

opt.relativenumber = true

-- search
opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = true
opt.incsearch = true

-- visual
opt.cursorline = true
opt.wrap = false
opt.linebreak = false
opt.termguicolors = true

-- indent
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

vim.opt.completeopt = "menu,menuone,noselect"

