vim.g.mapleader = ' '

local set     = vim.opt
local cmd     = vim.cmd
local keymap  = vim.keymap


set.number = true
-- opt.relativenumber = true -- Not ready yet.
set.clipboard = 'unnamedplus' -- Yank to clipboard
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.cursorline    = true
set.termguicolors = true

keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc ='No highlight' })
keymap.set('n', '<leader>ee', '<cmd>Ex<CR>', { desc = 'Open diagnostic [Q]uickfix list' })
