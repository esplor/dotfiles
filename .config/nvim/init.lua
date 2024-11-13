require 'options'
require 'keymaps'
require 'autocmds'

require 'lazy-init'

-- Setup lazy.nvim
require('lazy').setup {
  spec = {
    -- import your plugins
    { import = 'plugins' },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { 'tokyonight-storm' } },
  ui = { border = 'rounded' },
  -- automatically check for plugin updates
  checker = { enabled = true },
}
