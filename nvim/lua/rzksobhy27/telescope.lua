local telescope = require("telescope")
local themes = require("telescope.themes")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local nnoremap = require("rzksobhy27.map").nnoremap

telescope.setup({
    defaults = {
        theme = "ivy",
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        ["ui-select"] = {
            themes.get_dropdown(),
        },
    },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

nnoremap("<leader>pf", builtin.find_files)

nnoremap("<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep For > ") })
end)

nnoremap("<leader>pw", function()
    builtin.grep_string({ search = vim.fn.expand("<cword>") })
end)

nnoremap("<leader>pW", function()
    builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
end)

nnoremap("<leader>pb", builtin.buffers)
