vim.g.mapleader = " "

local vks = vim.keymap.set
vks("n", "<leader>ee", vim.cmd.Ex)
vks("n", "<leader>lp", vim.cmd.Lazy)

local tsb = require('telescope.builtin')
vks('n', '<leader>ff', tsb.find_files, {})
vks('n', '<leader>fg', tsb.live_grep, {})
vks('n', '<leader>fb', tsb.buffers, {})
vks('n', '<leader>fh', tsb.help_tags, {})
