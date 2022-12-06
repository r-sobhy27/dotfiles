local dap = require("dap")
local dapui = require("dapui")
local dap_vtext = require("nvim-dap-virtual-text")

local nnoremap = require("rzksobhy27.map").nnoremap

dapui.setup()
dap_vtext.setup({})

dap.listeners.after.event_initialized["rzksobhy27"] = function()
    -- terminate dap
    nnoremap("<F1>", dap.terminate)

    -- toggle dapui
    nnoremap("<F4>", dapui.toggle)

    -- dap keymaps
    nnoremap("<F10>", dap.step_over)
    nnoremap("<F11>", dap.step_into)
    nnoremap("<F12>", dap.step_out)

    dap_vtext.enable()
end

local function shutdown()
    -- delete keymaps
    pcall(vim.keymap.del, "n", "<F1>")
    pcall(vim.keymap.del, "n", "<F4>")
    pcall(vim.keymap.del, "n", "<F10>")
    pcall(vim.keymap.del, "n", "<F11>")
    pcall(vim.keymap.del, "n", "<F12>")

    dapui.close({})
    dap_vtext.disable()
end

dap.listeners.after.disconnect["rzksobhy27"] = shutdown
dap.listeners.after.event_terminated["rzksobhy27"] = shutdown
dap.listeners.after.event_exited["rzksobhy27"] = shutdown

require("rzksobhy27.dap.adapters")
require("rzksobhy27.dap.configurations")
