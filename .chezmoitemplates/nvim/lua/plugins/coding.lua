return {
    { 
        "norcalli/nvim-colorizer.lua",
        config = function ()
            require("colorizer").setup();
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup();
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
          "3rd/image.nvim",
        },
    },
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("hlchunk").setup({
                chunk = { enable = true },
            })
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
    },
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            animation = true,
        }
    },
    { "kazhala/close-buffers.nvim", },
    { 'numToStr/Comment.nvim', }, 
    { 
        "windwp/nvim-ts-autotag", 
        event = { "BufReadPre", "BufNewFile" },
    },
    { "anuvyklack/pretty-fold.nvim", },
    { "anuvyklack/fold-preview.nvim", dependencies = { "anuvyklack/keymap-amend.nvim" }, },
    { "rachartier/tiny-inline-diagnostic.nvim", priority=1000 },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = function ()
            require("noice").setup({
                background_color = "#000000",
            });
        end,
        dependencies = {
          "MunifTanjim/nui.nvim",
          "rcarriga/nvim-notify",
          }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        keys = {
          {
            "<leader>?",
            function()
              require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
          },
        },
      },
    {
        "akinsho/toggleterm.nvim", version = "*", config = true
    }
}
