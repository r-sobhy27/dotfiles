local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

require("lsp-inlayhints").setup({
    inlay_hints = {
        highlight = "Comment",
    },
})

local M = {}

M.keymaps = {
    ["K"] = vim.lsp.buf.hover,
    ["gd"] = vim.lsp.buf.definition,
    ["gr"] = vim.lsp.buf.references,
    ["<F2>"] = vim.lsp.buf.rename,
    ["<localleader>f"] = vim.lsp.buf.format,
    ["<localleader>a"] = vim.lsp.buf.code_action,
    ["<localleader>d"] = vim.diagnostic.open_float,
}

return M
