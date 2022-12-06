local nnoremap = require("rzksobhy27.map").nnoremap

nnoremap("<leader>a", require("harpoon.mark").add_file)
nnoremap("<leader>h", require("harpoon.ui").toggle_quick_menu)

for i = 0, 9 do
    nnoremap("<leader>" .. i, string.format([[:lua require("harpoon.ui").nav_file(%i)<CR>]], i))
end
