local dap = require("dap")

local codelldb_path = os.getenv("HOME") .. "/opt/codelldb/"
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = codelldb_path .. "/adapter/codelldb",
        args = { "--port", "${port}" },
    },
}

dap.adapters.delve = {
    type = "server",
    port = "${port}",
    executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
    },
}
