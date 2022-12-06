local M = {}

local function scheduled_error(err)
    vim.schedule(function()
        vim.notify(err, vim.log.levels.ERROR)
    end)
end

local function get_params()
    return {
        textDocument = vim.lsp.util.make_text_document_params(),
        position = nil, -- get em all
    }
end

local function build_label(args)
    local ret = ""
    for _, value in ipairs(args.cargoArgs) do
        ret = ret .. value .. " "
    end

    for _, value in ipairs(args.cargoExtraArgs) do
        ret = ret .. value .. " "
    end

    if not vim.tbl_isempty(args.executableArgs) then
        ret = ret .. "-- "
        for _, value in ipairs(args.executableArgs) do
            ret = ret .. value .. " "
        end
    end
    return ret
end

local function get_options(result)
    local option_strings = {}

    for _, debuggable in ipairs(result) do
        local label = build_label(debuggable.args)
        local str = label
        table.insert(option_strings, str)
    end

    return option_strings
end

local function filter_debug_opts(result)
    local ret = {}

    ret = vim.tbl_filter(function(value)
        return value.args.cargoArgs[1] ~= "check"
    end, result)

    for _, value in ipairs(ret) do
        if value.args.cargoArgs[1] == "run" then
            value.args.cargoArgs[1] = "build"
        elseif value.args.cargoArgs[1] == "test" then
            table.insert(value.args.cargoArgs, 2, "--no-run")
        end
    end

    return ret
end

local function get_cargo_args_from_runnables_args(runnable_args)
    local cargo_args = runnable_args.cargoArgs

    table.insert(cargo_args, "--message-format=json")

    for _, value in ipairs(runnable_args.cargoExtraArgs) do
        table.insert(cargo_args, value)
    end

    return cargo_args
end

local function handler(_, result)
    if result == nil then
        return
    end
    result = filter_debug_opts(result)

    local options = get_options(result)
    vim.ui.select(options, { prompt = "Debuggables", kind = "rust-tools/debuggables" }, function(_, choice)
        local args = result[choice].args

        local dap = require("dap")
        local Job = require("plenary.job")

        local cargo_args = get_cargo_args_from_runnables_args(args)

        Job
            :new({
                command = "cargo",
                args = cargo_args,
                cwd = args.workspaceRoot,
                on_exit = function(j, code)
                    if code and code > 0 then
                        scheduled_error(
                            "An error occurred while compiling. Please fix all compilation issues and try again."
                        )
                    end
                    vim.schedule(function()
                        for _, value in pairs(j:result()) do
                            local json = vim.fn.json_decode(value)
                            if type(json) == "table" and json.executable ~= vim.NIL and json.executable ~= nil then
                                dap.run({
                                    name = "rust debug",
                                    type = "codelldb",
                                    request = "launch",
                                    program = json.executable,
                                    args = args.executableArgs or {},
                                    cwd = args.workspaceRoot,
                                    stopOnEntry = false,
                                    runInTerminal = false,
                                })
                                break
                            end
                        end
                    end)
                end,
            })
            :start()
    end)
end

function M.start_debugging()
    vim.lsp.buf_request(0, "experimental/runnables", get_params(), handler)
end

return M
