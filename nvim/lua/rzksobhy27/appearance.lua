-- require("tokyonight").setup({
--     style = "storm",
--     transparent = true,
--     terminal_colors = true,
--     styles = {
--         comments = { italic = false },
--         keywords = { italic = false },
--     },
--     on_highlights = function(hi, c)
--         hi.CursorLine = { bg = c.none }
--         hi.CursorLineNr = { bg = c.none }
--     end,
-- })
--
-- vim.cmd.colorscheme("tokyonight")

require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = false,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {
        CursorLine = { bg = "NONE" },
        CursorLineNr = { bg = "NONE" },
    },
    dim_inactive = false,
    transparent_mode = false,
})

vim.cmd("colorscheme gruvbox")
