return {
    { 
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "cpp", "lua", "javascript", "typescript",
                    "rust", "python", "go", "bash",
                    "json", "toml", "yaml", "html", "css",
                    "dockerfile", "git_config", "gitignore",
                },
                highlight = {
                    enable = true, -- ハイライトを有効化
                    additional_vim_regex_highlighting = false, -- catpuucin用
                    disable = {},
                },
                indent ={
                  enable =true,
                  disable ={"html"},
                },
                autotag = {
                  enable = true,
                },
            })
        end,
        opts = function (_, opts)
            opts.ignore_install = { "help" }
        end
    
    },
}