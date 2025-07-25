-- core/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

map("n", "<leader>pv", vim.cmd.Ex, opts)
map("i", "jk", "<Esc>", opts)

