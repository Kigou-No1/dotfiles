return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
        config = function ()
            require("telescope").setup({
                extensions = {
                    fzf = {
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    }
                }
            });
            require("telescope").load_extension("fzf");
        end
    },
    { 
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },

}
