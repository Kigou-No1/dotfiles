return {
    { 
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function ()
            require("catppuccin").setup({
                flavour = "macchiato",
                transparent_background = true,
                integrations = {
                    treesitter = true,
                    gitsigns = true,
                    telescope = true,
                }
            });
            vim.cmd([[colorscheme catppuccin-macchiato]])
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'catppuccin',
                    section_separators = {'', ''},
                    component_separators = {'', ''},
                }
            });
        end
    },
    {
        'b0o/incline.nvim',
        config = function()
          require('incline').setup()
        end,
        event = 'VeryLazy',
    },
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", },
        config = function()
            local startify = require("alpha.themes.startify");
            startify.file_icons.provider = "devicons";
            require("alpha").setup(startify.config);
        end,
    },
}
