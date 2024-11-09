return { 
  {'folke/todo-comments.nvim', opts = {} },
  {
    'shaunsingh/nord.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'nord'
    end,
  },
}
