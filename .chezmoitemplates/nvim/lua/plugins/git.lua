return {
    { 
        "dinhhuy258/git.nvim",
        config = function ()
            require("git").setup()
        end
    },
    { 
        "lewis6991/gitsigns.nvim",
        config = function ()
            require("gitsigns").setup()
        end
    },
}