return {
    -- LSP Server
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim", config = function() require("mason").setup(); end, },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local lspconfig = require("mason-lspconfig");
            lspconfig.setup();
            lspconfig.setup_handlers {
                function(srv_name)
                    require("lspconfig")[srv_name].setup {}
                end,
            }
        end,
    },
    -- Linter
    { "mfussenegger/nvim-lint", },
    { "rshkarin/mason-nvim-lint", },
    -- Completions
    { "L3MON4D3/LuaSnip", },
    { "onsails/lspkind.nvim", },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-[]>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-]>"] = cmp.mapping.scroll_docs(4),
                    ["<C-space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources(
                    {
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                    },
                    {
                        { name = "buffer" },
                    }
                ),
                format = require("lspkind").cmp_format({
                    mode = "symbol",
                    maxwidth = { menu = 50, abbr = 50, },
                    ellipsis_char = "...",
                    show_labelDetais = true,
                    before = function(entry, vim_item)
                        return vim_item
                    end,
                })
            })
        end
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        config = function()
            local cmp = require("cmp_nvim_lsp")
            cmp.default_capabilities()
            cmp.setup()
        end,
    },
    { "hrsh7th/cmp-buffer" },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts) require'lsp_signature'.setup(opts) end
    },
    { "j-hui/fidget.nvim", }
}
