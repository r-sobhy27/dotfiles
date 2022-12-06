require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = false },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["ic"] = "@class.inner",
                ["ac"] = "@class.outer",
                ["if"] = "@function.inner",
                ["af"] = "@function.outer",
            },
        },
    },
})
