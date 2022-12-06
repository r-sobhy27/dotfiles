require("rzksobhy27.lsp.config")
require("rzksobhy27.lsp.null-ls")

local lsp = require("lspconfig")
local def_opts = require("rzksobhy27.lsp.servers").def_opts
local def_keymaps = require("rzksobhy27.lsp.config").keymaps
local servers = require("rzksobhy27.lsp.servers").servers
local nnoremap = require("rzksobhy27.map").nnoremap

for server, server_opts in pairs(servers) do
    local keymaps = def_keymaps

    if server_opts.keymaps then
        keymaps = vim.tbl_extend("force", keymaps, server_opts.keymaps)
        server_opts.keymaps = nil
    end

    local opts = vim.tbl_deep_extend("force", def_opts, server_opts)

    opts.on_attach = function(client, bufnr)
        if type(server_opts.on_attach) == "function" then
            server_opts.on_attach(client, bufnr)
        end

        for lhs, rhs in pairs(keymaps) do
            nnoremap(lhs, rhs, { buffer = bufnr })
        end

        require("lsp-inlayhints").on_attach(client, bufnr, false)
    end

    lsp[server].setup(opts)
end
