local paths = {
    "disable_bultins",
    "misc",
    "packer",
    "telescope",
    "treesitter",
    "appearance",
    "others",
    "cmp",
    "lsp",
    "dap",
}

local errors = {}
for _, path in ipairs(paths) do
    local status, err = pcall(require, "rzksobhy27." .. path)
    if not status then
        table.insert(errors, err)
    end
end

for _, err in ipairs(errors) do
    error(err)
end
