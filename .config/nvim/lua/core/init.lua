vim.g.mapleader = ' '

local set = vim.opt
local cmd = vim.cmd
local o   = vim.o


set.number = true
-- opt.relativenumber = true -- Not ready yet.
set.clipboard = 'unnamedplus' -- Yank to clipboard
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

-- vim.o
o.cursorline    = true
o.termguicolors = true

-- vim.cmd
-- cmd.colorscheme 'retrobox'

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc ='No highlight' })
vim.keymap.set('n', '<leader>ee', '<cmd>Ex<CR>', { desc = 'Open diagnostic [Q]uickfix list' })

