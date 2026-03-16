-- The leader key is a prefix for custom keymaps (e.g. <leader>f = your shortcut)
-- <space> is a common choice because it's easy to reach and unused by default
-- NOTE: Must be set before plugins load, otherwise they'll use the wrong leader
-- Ensure ~/.local/bin is in PATH so tools like claude, pip-installed CLIs, etc. are found
vim.env.PATH = vim.env.PATH .. ":/home/eslo/.local/bin"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
-- Nerd Fonts add icons (file icons, git symbols, etc.) to your terminal
vim.g.have_nerd_font = true

-- Always use a block cursor in normal, visual, and insert mode
-- Default neovim changes cursor shape per mode (beam in insert, block in normal)
vim.opt.guicursor = "n-v-c-i:block"

-- Show absolute line number for the current line
vim.opt.number = true
-- Show relative line numbers for all other lines (useful for jumping: e.g. 5j / 5k)
vim.opt.relativenumber = true

-- Allow the cursor to move freely in visual block mode, even past end of line
vim.opt.virtualedit = "block"

-- Enable mouse support (click to move cursor, drag to resize splits, scroll, etc.)
vim.opt.mouse = "a"

-- Hide the mode indicator (-- INSERT --, -- NORMAL --) since lualine shows it already
vim.opt.showmode = false

-- Share clipboard with the OS — yank/paste works across neovim and other apps
-- "unnamedplus" uses the system clipboard (Ctrl+C / Ctrl+V register)
vim.opt.clipboard = "unnamedplus"

-- When a line is wrapped visually, indent the continuation to match the start
vim.opt.breakindent = true

-- Persist undo history across sessions — you can undo even after closing the file
vim.opt.undofile = true

-- Search is case-insensitive by default...
vim.opt.ignorecase = true
-- ...but becomes case-sensitive if you type any uppercase letter
vim.opt.smartcase = true

-- Always show the sign column (the gutter left of line numbers)
-- Prevents the editor from jumping when git signs or diagnostics appear
vim.opt.signcolumn = "yes"

-- How quickly neovim writes to disk (triggers CursorHold events, used by LSP)
vim.opt.updatetime = 250

-- How long to wait for a key sequence to complete (e.g. for which-key to show up)
vim.opt.timeoutlen = 300

-- Open vertical splits to the right instead of the left
vim.opt.splitright = true
-- Open horizontal splits below instead of above
vim.opt.splitbelow = true

-- Make certain invisible characters visible:
vim.opt.list = true
local in_tty = vim.env.TERM == "linux"
if in_tty then
  -- TTY can't render unicode; use ASCII-only characters
  vim.opt.listchars = { tab = "> ", trail = "-", nbsp = "_" }
else
  vim.opt.listchars = {
    tab = "> ",   -- tabs show as ">  " (helps spot accidental tabs)
    trail = "·",  -- trailing spaces show as dots
    nbsp = "_",   -- non-breaking spaces show as underscores
  }
end

-- Show a live preview of :s/foo/bar replacements as you type
vim.opt.inccommand = "split"

-- Highlight the line the cursor is currently on
vim.opt.cursorline = true

-- Keep at least this many lines visible above/below the cursor when scrolling
-- 100 effectively keeps the cursor centered vertically
vim.opt.scrolloff = 100
-- Same idea but for horizontal scrolling
vim.opt.sidescrolloff = 10

-- Disable line wrapping — long lines extend off-screen instead of wrapping
vim.opt.wrap = false
-- Enable 24-bit RGB colors (required for most colorschemes to look correct)
-- Disabled in TTY (linux console) which only supports 8/16 colors
vim.opt.termguicolors = not in_tty

-- Indentation
vim.opt.autoindent = true  -- copy indent from current line when starting a new line
vim.opt.smartindent = true -- add extra indent after opening braces/blocks (fallback when treesitter isn't active)

-- Tabs (default: 4 spaces; overridden per filetype in autocmds.lua)
vim.opt.tabstop = 4      -- how many columns a tab character counts as (visual width)
vim.opt.expandtab = true -- insert spaces instead of a real tab character when pressing <Tab>
vim.opt.shiftwidth = 4   -- number of spaces used for each level of indentation (>> / << / autoindent)
