-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Filetype-specific indentation
-- These override the global defaults set in options.lua for specific languages.
-- The standard in most communities is 2 spaces for web languages, 4 for others.
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Use 2-space indentation for web/config filetypes',
  group = vim.api.nvim_create_augroup('indent-two-spaces', { clear = true }),
  -- 2 spaces: JS/TS ecosystem, HTML, CSS, config formats, Lua (neovim convention)
  pattern = {
    'javascript', 'javascriptreact',
    'typescript', 'typescriptreact',
    'html', 'css', 'scss', 'vue', 'svelte',
    'json', 'jsonc', 'yaml', 'toml',
    'lua',
    'markdown',
    'xml',
    'sh', 'bash', 'zsh',
  },
  callback = function()
    vim.opt_local.tabstop = 2     -- a tab looks like 2 columns
    vim.opt_local.shiftwidth = 2  -- indent/dedent by 2 spaces
    vim.opt_local.expandtab = true -- still use spaces, not tabs
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Use real tabs for Go and Makefiles (language convention)',
  group = vim.api.nvim_create_augroup('indent-real-tabs', { clear = true }),
  pattern = { 'go', 'make' },
  callback = function()
    vim.opt_local.tabstop = 4      -- a tab renders as 4 columns
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false -- go and make require real tab characters
  end,
})

