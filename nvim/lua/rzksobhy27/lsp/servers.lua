local M = {}
local dap = require("dap")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

M.def_opts = {
    capabilities = capabilities,
}

M.servers = {
    cmake = {},
    clangd = {
        cmd = {
            "clangd",
            "--index",
            "--background-index",
            "--suggest-missing-includes",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
        },
    },
    pyright = {},
    gopls = {
        on_attach = function(client, _)
            client.server_capabilities.documentFormattingProvider = false
        end,
    },
    rust_analyzer = {
        cmd = { "rustup", "run", "stable", "rust-analyzer" },
        keymaps = {
            ["<F5>"] = function()
                if dap.session() then
                    dap.continue()
                else
                    require("rzksobhy27.dap.rust").start_debugging()
                end
            end,
            ["<F9>"] = dap.toggle_breakpoint
        },
    },
    tsserver = {
        on_attach = function(client, _)
            client.server_capabilities.documentFormattingProvider = false
        end,
    },
    jsonls = {
        on_attach = function(client, _)
            client.server_capabilities.documentFormattingProvider = false
        end,
        settings = {
            json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
            },
        },
    },
    sumneko_lua = {
        on_attach = function(client, _)
            client.server_capabilities.documentFormattingProvider = false
        end,
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { "vim" },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    },
}

return M
