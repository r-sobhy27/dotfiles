-- ============================================================================== --
-- Options
-- ============================================================================== --
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false

vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.expandtab = true

vim.opt.scrolloff = 6

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.mouse = "a"
vim.opt.guicursor = ""
vim.opt.showmode = false
vim.opt.showcmd = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.laststatus = 3
-- vim.opt.statusline = " %{%v:lua.require'rzksobhy27.statusline'.gen()%} "

vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "
vim.g.maplocalleader = " l"
vim.g.netrw_banner = 0
-- ============================================================================== --
-- Keymaps
-- ============================================================================== --
local Remap = require("rzksobhy27.map")
local nmap = Remap.nmap
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap
local inoremap = Remap.inoremap
local cnoremap = Remap.cnoremap

nnoremap("<leader>e", ":Ex<CR>")

nnoremap("gq", ":tabclose<CR>")

vnoremap("<", "<gv")
vnoremap(">", ">gv")
nnoremap("<", "V<<ESC>")
nnoremap(">", "V><ESC>")

nnoremap("<M-j>", ":m +1<CR>")
nnoremap("<M-k>", ":m -2<CR>")
vnoremap("<M-j>", ":m '>+1<CR>gv=gv")
vnoremap("<M-k>", ":m '<-2<CR>gv=gv")

nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

nnoremap("Y", "yg$")

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

inoremap("<C-c>", "<ESC>")
vnoremap("<C-c>", "<ESC>")
nnoremap("<C-c>", "<ESC>")
cnoremap("<C-c>", "<ESC>")

nmap("<C-z>", "<NOP>")

xnoremap("<leader>p", '"_dP')
