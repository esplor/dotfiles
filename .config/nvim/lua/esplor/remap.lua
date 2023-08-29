vim.g.mapleader = " "

local vks = vim.keymap.set
vks("n", "<leader>ee", vim.cmd.Ex)
vks("n", "<leader>lp", vim.cmd.Lazy)

local tele_builtin = require('telescope.builtin')
vks('n', '<leader>ff', tele_builtin.find_files, {})
vks('n', '<leader>fg', tele_builtin.live_grep, {})
vks('n', '<leader>fb', tele_builtin.buffers, {})
vks('n', '<leader>fh', tele_builtin.help_tags, {})
