local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local nnoremap = require("rzksobhy27.map").nnoremap

null_ls.setup({
    on_attach = function(_, bufnr)
        nnoremap("<localleader>f", vim.lsp.buf.format, { buffer = bufnr })
    end,
    sources = {
        formatting.stylua,
        formatting.prettier,

        formatting.gofmt,
        formatting.goimports,

        diagnostics.eslint,
    },
})
