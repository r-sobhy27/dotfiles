local M = {}

---@param event string|table
---@param callback function
---@param opts table
function M.cmd(event, callback, opts)
    opts.group = opts.group or "group"
    local group = vim.api.nvim_create_augroup(opts.group, { clear = true })

    vim.api.nvim_create_autocmd(event, {
        group = group,
        pattern = opts.pattern,
        callback = callback,
    })
end

return M
