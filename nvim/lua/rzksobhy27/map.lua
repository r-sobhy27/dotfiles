local M = {}

---@param mode string
---@param outer_opts table|nil
---@return function
local function bind(mode, outer_opts)
    outer_opts = outer_opts or { noremap = true, silent = true }

    ---@param lhs string
    ---@param rhs function|string
    ---@param opts table|nil
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force", outer_opts, opts or {})
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

M.nmap = bind("n", { noremap = false })
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
M.cnoremap = bind("c")

return M
