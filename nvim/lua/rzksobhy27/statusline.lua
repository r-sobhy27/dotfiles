local M = {}
local Marked = require("harpoon.mark")
local utils = require("harpoon.utils")

local function file_name(path)
    local last_idx = ""

    for idx in string.gmatch(path, "()/") do
        last_idx = idx
    end

    return string.sub(path, last_idx + 1)
end

function M.gen()
    local ret = ""
    local width = vim.api.nvim_eval_statusline((" "):rep(1000), {}).width
    local cursor = table.concat(vim.api.nvim_win_get_cursor(0), ",")

    for idx = 1, Marked.get_length() do
        local file = Marked.get_marked_file_name(idx)
        ret = ret .. idx .. ":" .. file_name(file)

        if file == utils.normalize_path(vim.api.nvim_buf_get_name(0)) then
            ret = ret .. "* "
        else
            ret = ret .. "  "
        end
    end

    width = width - ret:len() - cursor:len() - 10

    return ret .. (" "):rep(width) .. cursor
end

return M
